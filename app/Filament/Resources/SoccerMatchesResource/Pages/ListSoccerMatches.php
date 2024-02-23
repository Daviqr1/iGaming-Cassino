<?php

namespace App\Filament\Resources\SoccerMatchesResource\Pages;

use App\Filament\Resources\SoccerMatchesResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSoccerMatches extends ListRecords
{
    protected static string $resource = SoccerMatchesResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
