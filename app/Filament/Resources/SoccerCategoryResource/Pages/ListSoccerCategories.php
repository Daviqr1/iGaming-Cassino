<?php

namespace App\Filament\Resources\SoccerCategoryResource\Pages;

use App\Filament\Resources\SoccerCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSoccerCategories extends ListRecords
{
    protected static string $resource = SoccerCategoryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
