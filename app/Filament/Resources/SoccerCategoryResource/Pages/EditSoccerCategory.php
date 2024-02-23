<?php

namespace App\Filament\Resources\SoccerCategoryResource\Pages;

use App\Filament\Resources\SoccerCategoryResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSoccerCategory extends EditRecord
{
    protected static string $resource = SoccerCategoryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
