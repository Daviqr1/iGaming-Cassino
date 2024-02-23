<?php

namespace App\Filament\Resources\SoccerBetsResource\Pages;

use App\Filament\Resources\SoccerBetsResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSoccerBets extends EditRecord
{
    protected static string $resource = SoccerBetsResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
