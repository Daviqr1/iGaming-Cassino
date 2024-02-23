<?php

namespace App\Filament\Resources\BetEventResource\Pages;

use App\Filament\Resources\BetEventResource;
use App\Models\BetUser;
use App\Models\User;
use App\Notifications\PrizeLoseNotification;
use App\Notifications\PrizeWonNotification;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Database\Eloquent\Model;

class EditBetEvent extends EditRecord
{
    protected static string $resource = BetEventResource::class;

    /**
     * @return array|Actions\Action[]|Actions\ActionGroup[]
     */
    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }

    /**
     * @param Model $record
     * @param array $data
     * @return Model
     */
    protected function handleRecordUpdate(Model $record, array $data): Model
    {
        if($data['finished'] && $data['event_result_a'] != null && $data['event_result_b'] != null) {
            $this->payWinners($record, $data);
            $data['finished'] = 1;
        }

        $record->update($data);

        return $record;
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
