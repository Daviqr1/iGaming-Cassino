<?php

namespace App\Filament\Resources\BetEventResource\Pages;

use App\Filament\Resources\BetEventResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBetEvents extends ListRecords
{
    protected static string $resource = BetEventResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
