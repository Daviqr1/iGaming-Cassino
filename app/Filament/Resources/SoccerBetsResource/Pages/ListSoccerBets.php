<?php

namespace App\Filament\Resources\SoccerBetsResource\Pages;

use App\Filament\Resources\SoccerBetsResource;
use App\Models\SoccerBets;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Pages\ListRecords\Tab;

class ListSoccerBets extends ListRecords
{
    protected static string $resource = SoccerBetsResource::class;

    public function getTabs(): array
    {
        return [
            'Todos' => Tab::make(),
            'Essa Semana' => Tab::make()->modifyQueryUsing(fn($query) => $query->where('created_at', '>', now()->subWeek()))->badge(SoccerBets::query()->where('created_at', '>', now()->subWeek())->count()),
            'Essa Mês' => Tab::make()->modifyQueryUsing(fn($query) => $query->where('created_at', '>', now()->subMonth()))->badge(SoccerBets::query()->where('created_at', '>', now()->subMonth())->count()),
            'Essa Ano' => Tab::make()->modifyQueryUsing(fn($query) => $query->where('created_at', '>', now()->subYear()))->badge(SoccerBets::query()->where('created_at', '>', now()->subYear())->count()),
        ];
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    /**
     * @return string[]
     */
    protected function getHeaderWidgets(): array
    {
        return [
            SoccerBetsResource\Widgets\BetsOverview::class
        ];
    }
}
