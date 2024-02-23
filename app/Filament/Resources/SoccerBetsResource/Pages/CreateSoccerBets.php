<?php

namespace App\Filament\Resources\SoccerBetsResource\Pages;

use App\Filament\Resources\SoccerBetsResource;
use App\Models\Wallet;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;

class CreateSoccerBets extends CreateRecord
{
    protected static string $resource = SoccerBetsResource::class;

    /**
     * Posso manipular os dados antes da criação
     * @param array $data
     * @return Model
     */
    protected function handleRecordCreation(array $data): Model
    {
        $wallet = Wallet::find($data['user_id']);
        if(!empty($wallet)) {
            $wallet->decrement('balance', \Helper::amountPrepare($data['amount']));
        }

        return static::getModel()::create($data);
    }

    /**
     * @return Notification|null
     */
    protected function getCreatedNotification(): ?Notification
    {
        return Notification::make()
            ->success()
            ->title('Aposta criada')
            ->body('Aposta criada com sucesso.');
    }

    protected function beforeFill(): void
    {
        // Runs before the form fields are populated with their default values.
    }

    protected function afterFill(): void
    {
        // Runs after the form fields are populated with their default values.
    }

    protected function beforeValidate(): void
    {
        // Runs before the form fields are validated when the form is submitted.
    }

    protected function afterValidate(): void
    {
        // Runs after the form fields are validated when the form is submitted.
    }

    protected function beforeCreate(): void
    {
        // Runs before the form fields are saved to the database.
    }

    protected function afterCreate(): void
    {
        // Runs after the form fields are saved to the database.
    }

    /**
     * @return string
     */
    protected function getRedirectUrl(): string
    {
        return static::getResource()::getUrl('index');
    }
}
