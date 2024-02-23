<?php

namespace App\Traits\Sport;
use App\Models\BetCategory;
use App\Models\BetEvent;
use App\Models\BetUser;
use App\Models\User;
use App\Notifications\PrizeLoseNotification;
use App\Notifications\PrizeWonNotification;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

trait SportTrait
{
    private static bool $isLive = false;
    private static string $apiKeyTest = 'test85g57';
    private static string $apiKeyLive = 'test85g57';
    private static string $uri = 'http://127.0.0.1:3001/';

    /**
     * Pegar api key
     * @return string
     */
    private function getApiKey(): string
    {
        return self::$isLive ? self::$apiKeyLive : self::$apiKeyTest;
    }

    /**
     * @return void
     */
    public function verificarPartidas()
    {
        $currentDateTime = Carbon::now();
        $threeDaysAgo = $currentDateTime->subDays(3);

        $events = BetEvent::with(['betCategory'])
            ->where('finished', 0)
            ->whereBetween('event_day', [$threeDaysAgo, Carbon::now()->addHour()])
            ->get();

        if(count($events) > 0) {
            foreach ($events as $event) {
                $mathinfo = Carbon::parse($event->event_day)->format('d-m-Y').'-'.Str::slug($event->name);
                $this->infoMatche($event->id, $event->betCategory->slug, str_replace("-vs-", "-x-", $mathinfo));
            }
        }
    }

    /**
     * Pegar Campeonatos
     * @return void
     */
    public function infoMatche($id, $campeonato, $mathinfo)
    {
        $uri = self::$uri . 'campeonato/'.$campeonato.'/match/'.$mathinfo;
        echo "$uri\n\n";
        $response = Http::get($uri);
        if($response->successful()) {
            $partida = $response->json();

            if($partida['resultA'] != null && $partida['resultA'] != "") {
                $this->finishMatche($id, $partida);
            }else{
                echo "Resultado vazio\n";
            }
        }
    }

    /**
     * @param $id
     * @param $matche
     * @return void
     */
    private function finishMatche($id, $matche)
    {
        $event = BetEvent::find($id);
        if(!empty($event)) {
            $saveResult = $event->update([
                'event_result_a' => $matche['resultA'],
                'event_result_b' => $matche['resultB'],
                'finished' => 1
                ]);

            echo "Partida atualizada\n\n";
            if($saveResult) {
                echo "Evento atualizado\n";

                $this->payWinners($event, [
                    'event_result_a' => $matche['resultA'],
                    'event_result_b' => $matche['resultB'],
                ]);
            }else{
                echo "Evento não foi salvo\n";
            }
        }else{
            echo "Evento não localizado\n";
        }
    }

    /**
     * @param $record
     * @param $data
     * @return void
     */
    private function payWinners($record, $data)
    {
        $resultA = $data['event_result_a'];
        $resultB = $data['event_result_b'];

        // Obtenha todas as apostas para esta partida
        $bets = BetUser::where('bet_event_id', $record->id)->get();

        if(count($bets) > 0) {
            // Calcule o total apostado nesta partida
            $totalBet       = $bets->sum('amount');
            $setting        = \Helper::getSetting();
            $lucroCasa      = \Helper::porcentagem_xn($setting->soccer_percentage, $totalBet);
            $totalBetAmount = ($totalBet - $lucroCasa);

            // Inicialize um array para armazenar os prêmios dos vencedores
            $prizes = [];

            foreach ($bets as $bet) {
                // Verifique se a aposta é vencedora
                if ($bet->event_result_a === $resultA && $bet->event_result_b === $resultB) {
                    // Calcule o prêmio proporcional com base no valor apostado
                    $prizeForWinner = ($bet->amount / $totalBetAmount) * $totalBetAmount;
                    // Armazene o prêmio para esse vencedor
                    $prizes[$bet->user_id] = $prizeForWinner;

                }
            }

            // Soma dos prêmios para os vencedores
            $totalPrizeAmount = array_sum($prizes);

            // Divida o prêmio proporcional entre os vencedores
            foreach ($prizes as $userId => $prize) {

                // Encontre o usuário pelo ID ou usando sua lógica
                $user = User::find($userId);

                // Notificando o usuário
                $user->notify(new PrizeWonNotification($prize, $record->name));

                // Pagar o prêmio ao usuário
                $user->wallet->increment('balance', floatval($prize));

                // Definir aposta como premiada
                $betPay = BetUser::where('user_id', $userId)->first();
                $betPay->update(['reward_received' => $prize]);
            }

            // Calcula o valor restante para distribuir entre os não vencedores
            $remainingAmount = $totalBetAmount - $totalPrizeAmount;

            // Divida o valor restante proporcionalmente entre os não vencedores
            $losingBets = $bets->reject(function ($bet) use ($resultA, $resultB) {
                return $bet->event_result_a === $resultA && $bet->event_result_b === $resultB;
            });

            $totalLosing            = $losingBets->sum('amount');
            $setting                = \Helper::getSetting();
            $profitHome             = \Helper::porcentagem_xn($setting->soccer_percentage, $totalLosing);
            $totalLosingBetAmount   = ($totalLosing - $profitHome);

            foreach ($losingBets as $bet) {
                // Calcule a parte proporcional para cada aposta não vencedora
                $prizeForLoser = ($bet->amount / $totalLosingBetAmount) * $remainingAmount;

                // Encontre o usuário pelo ID ou usando sua lógica
                $user = User::find($bet->user_id);

                // Notificando o usuário
                $user->notify(new PrizeLoseNotification($prizeForLoser, $record->name));

                // Pagar o prêmio ao usuário
                $user->wallet->increment('balance', floatval($prizeForLoser));

                // Definir aposta como premiada
                $betPay = BetUser::where('user_id', $bet->user_id)->first();
                $betPay->update(['reward_received' => $prizeForLoser]);
            }
        }
    }

    /**
     * @return void
     */
    public function prepararPartidas()
    {
        $campeonatos = BetCategory::where('bet_section_id', 1)->get();
        foreach($campeonatos as $campeonato) {
            $this->pegarPartidas($campeonato);
        }
    }

    /**
     * @return void
     */
    private function pegarPartidas($campeonato)
    {
        $response = Http::get(self::$uri . 'campeonato/'.$campeonato->slug);

        if($response->successful()) {
            $partidas = $response->json();

            if(count($partidas) > 0) {
                foreach($partidas as $partidasLista) {
                    foreach($partidasLista as $partida) {
                        $verPartida = BetEvent::where('bet_category_id', $campeonato->id)
                            ->where('event_a', $partida["teamA"]['name'])
                            ->where('event_b', $partida["teamB"]['name'])
                            ->whereDate('event_day', Carbon::parse($partida["date"]))
                            ->first();

                        if(empty($verPartida)) {
                            if($partida['status'] == 0) {
                                $logoA = $this->uploadFromUrl($partida["teamA"]['logo']);
                                $logoB = $this->uploadFromUrl($partida["teamB"]['logo']);

                                if(!empty($logoA) && !empty($logoB)) {
                                    $dataSave = [
                                        'bet_category_id' => $campeonato->id,
                                        'cover' => 'cover.jpg',
                                        'name' => $partida["title"],
                                        'description' => $partida["title"],
                                        'event_a' => $partida["teamA"]['name'],
                                        'event_a_logo' => $logoA,
                                        'event_b' => $partida["teamB"]['name'],
                                        'event_b_logo' => $logoB,
                                        'event_day' => Carbon::parse($partida["date"])
                                    ];

                                    BetEvent::create($dataSave);
                                    echo "Partida Salva\n";
                                }
                            }
                        }
                    }
                }
            }
        }
    }


    /**
     * Pegar Campeonatos
     * @return void
     */
    public function pegarCampeonatos()
    {
        $response = Http::get(self::$uri . 'campeonatos');
        if($response->successful()) {
            $campeonatos = $response->json();

            if(count($campeonatos) > 0) {
                foreach ($campeonatos as $campeonato) {
                    $this->salvarCampeonato($campeonato);
                }
            }
        }else{
            dd($response->body());
        }
    }

    /**
     * @param $campeonato
     * @return void
     */
    private function salvarCampeonato($campeonato)
    {
        $checkBetCategory = BetCategory::where('bet_section_id', 1)->where('name', $campeonato['name'])->first();
        if(empty($checkBetCategory)) {
            $dataSave = [
                'bet_section_id' => 1,
                'name' => $campeonato["name"],
                'description' => $campeonato["name"],
                'slug' => $campeonato["championship"],
                'active' => 1
            ];

            BetCategory::create($dataSave);
            echo "Categoria Salva\n";
        }
    }

    /**
     * @param $url
     * @return string|null
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    private function uploadFromUrl($url, $prefix = '.png')
    {
        try {

            $client = new Client();
            $response = $client->get($url);

            if ($response->getStatusCode() === 200) {
                $fileContent = $response->getBody();
                $fileName = time(). 'fut'.Str::random(8) . $prefix;
                Storage::disk('public')->put($fileName, $fileContent);

                return $fileName;
            }

            return null;
        } catch (\Exception $e) {
            return null;
        }
    }

}
