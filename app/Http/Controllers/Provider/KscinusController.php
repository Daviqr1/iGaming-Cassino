<?php

namespace App\Http\Controllers\Provider {

	use App\Helpers\Core as Helper;
	use App\Http\Controllers\Controller;
	use App\Models\GamesKscinus;
	use App\Models\User;
	use App\Models\Wallet;
	use GGdS\KscinusSDK\SDK;
	use Illuminate\Http\Request;
	use Illuminate\Support\Facades\Log;

	class KscinusController extends Controller
	{
		private $settings;
		function __construct()
		{
			$this->settings = Helper::getSetting();
		}
		public function Show($game) {
			$game = GamesKscinus::where('key', $game)->firstOrFail();
			return view('web.kscinus.view', [
				'game'			=> $game
			]);
		}
		public function PrePlay(Request $request, $game)
		{
			if(auth()->check()) {
				$sdk = new SDK();
				$signed = $sdk->SigninGame([
					'game'	=> $game,
					'type'	=> $request->get('type'),
					'email'	=> auth()->user()->email,
					'balance'	=> (auth()->user()->wallet->balance + auth()->user()->wallet->balance_bonus),
					'api-key'	=> $this->settings['kscinus_pub_key']
				], $this->settings['kscinus_pvt_key']);

				$token = Helper::MakeToken([
					'signed'	=> $signed
				]);

				return redirect()->route('web.kscinus.play', ['game' => $game, 'token' => base64_encode($token)]);
			}

			return back()->with('error', 'Você precisa fazer login para jogar');
		}

		public function Play(Request $request, $game)
		{
			if(auth()->check()) {
				$sdk = new SDK();
				$sdk->PlayerUpdate(
					auth()->user()->email, [
						'balance'		=> (auth()->user()->wallet->balance + auth()->user()->wallet->balance_bonus)
					],
					$this->settings['kscinus_pub_key'],
					$this->settings['kscinus_pvt_key']
				);

				$token = base64_decode($request->get('token'));

				$data = Helper::DecToken($token);

				$game = GamesKscinus::where([
					['key', '=', $game],
					['status', '=', 1]
				])->firstOrFail();

				$game->increment('views', 1);

				return view('web.kscinus.play', [
					'game_url'	=> $data['signed'],
					'game'			=> $game
				]);
			}

			return back()->with('error', 'Você precisa fazer login para jogar');
		}

		public function ListGames()
		{
			$sdk = new SDK();

			return $sdk->ListGames($this->settings['kscinus_pub_key']);
		}

		public function Callback(Request $request)
		{
			$body = NULL;
			$str_body = file_get_contents('php://input');
			$digest = NULL;

			$body = json_decode($str_body);
			if ($this->JSON_ERROR()) {
				$this->Error($this->JSON_ERROR(), $str_body);
			} else {
				$digest = hash_hmac('sha256', $str_body, $this->settings['kscinus_pvt_key']);
				if ($body->state == 'spin' || $body->state == 'lastRespin') {
					if ($request->get('signature') == $digest) {
						$user = User::where('email', $body->player)->first();

						if ($user) {
							Wallet::where('user_id', $user->id)->update([
								'balance'	=> ($body->balance + $body->win)
							]);
							$this->Log('user: ' . $user->email . ($body->win > 0 ? ' win ' . $body->win : '') . ($body->loss > 0 ? ' loss ' . $body->loss : '') );
							exit('ok');
						}

						exit('invalid user');
					}
					exit('invalid signature');
				}
				exit('ignored');
			}

			exit('invalid data');
		}

		public function CallbackRedirect(Request $request) {
			if ($request->get('game')) {
				return redirect()->route('web.kscinus.show', ['game' => $request->get('game')]);
			}
			return redirect('/');
		}

		public function JSON_ERROR()
		{
			$error = json_last_error() == JSON_ERROR_NONE ? NULL : [
				'error'		=> json_last_error(),
				'message'	=> NULL
			];

			switch (json_last_error()) {
				case JSON_ERROR_DEPTH:
					$error['message'] = 'Maximum stack depth exceeded';
					break;
				case JSON_ERROR_STATE_MISMATCH:
					$error['message'] = 'Underflow or the modes mismatch';
					break;
				case JSON_ERROR_CTRL_CHAR:
					$error['message'] = 'Unexpected control character found';
					break;
				case JSON_ERROR_SYNTAX:
					$error['message'] = 'Syntax error, malformed JSON';
					break;
				case JSON_ERROR_UTF8:
					$error['message'] = 'Malformed UTF-8 characters, possibly incorrectly encoded';
					break;
			}

			return $error;
		}

		public function Error($message, $context) {
			Log::error('KSCINUS_CALLBACK_ERROR', [$message, $context]);
		}

		public function Log($message) {
			Log::info('KSCINUS_CALLBACK_INFO: ' . $message);
		}
	}
}
