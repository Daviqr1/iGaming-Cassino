<?php

namespace App\Filament\Resources\BetCategoryResource\Pages;

use App\Filament\Resources\BetCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBetCategories extends ListRecords
{
    protected static string $resource = BetCategoryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
