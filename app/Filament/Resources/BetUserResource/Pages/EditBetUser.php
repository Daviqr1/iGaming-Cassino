<?php

namespace App\Filament\Resources\BetUserResource\Pages;

use App\Filament\Resources\BetUserResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditBetUser extends EditRecord
{
    protected static string $resource = BetUserResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
