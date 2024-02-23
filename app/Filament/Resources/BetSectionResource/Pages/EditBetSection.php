<?php

namespace App\Filament\Resources\BetSectionResource\Pages;

use App\Filament\Resources\BetSectionResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBetSection extends EditRecord
{
    protected static string $resource = BetSectionResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
