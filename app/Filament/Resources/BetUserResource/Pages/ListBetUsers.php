<?php

namespace App\Filament\Resources\BetUserResource\Pages;

use App\Filament\Resources\BetUserResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBetUsers extends ListRecords
{
    protected static string $resource = BetUserResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
