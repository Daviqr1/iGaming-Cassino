<?php

namespace App\Filament\Resources\SoccerBetsResource\Widgets;

use App\Models\SoccerBets;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class BetsOverview extends BaseWidget
{
    /**
     * @return array|Stat[]
     */
    protected function getStats(): array
    {
        $totalPremio = SoccerBets::sum('amount');
        $totalApostas = SoccerBets::count();
        $setting = \Helper::getSetting();
        $lucroCasa = \Helper::porcentagem_xn($setting->soccer_percentage, $totalPremio);

        return [
            Stat::make('Total de Aposta', $totalApostas)
                ->description('Total apostado')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success'),
            Stat::make('Prêmio', \Helper::amountFormatDecimal($totalPremio))
                ->description('Total arrecadado')
                //->descriptionIcon('heroicon-m-arrow-trending-down')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success'),
            Stat::make('Lucro da Casa', \Helper::amountFormatDecimal($lucroCasa))
                ->description($setting->soccer_percentage.'% lucro')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success'),
        ];
    }
}
