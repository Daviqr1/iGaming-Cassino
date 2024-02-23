<?php

namespace App\Filament\Resources\BetSectionResource\Pages;

use App\Filament\Resources\BetSectionResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBetSections extends ListRecords
{
    protected static string $resource = BetSectionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
