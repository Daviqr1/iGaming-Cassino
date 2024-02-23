<?php

namespace App\Filament\Resources;

use App\Filament\Resources\WithdrawalResource\Pages;
use App\Filament\Resources\WithdrawalResource\RelationManagers;
use App\Models\User;
use App\Models\Withdrawal;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Table;

class WithdrawalResource extends Resource
{

    protected static ?string $model = Withdrawal::class;

    protected static ?string $navigationIcon = 'heroicon-o-arrow-up-tray';

    protected static ?string $navigationLabel = 'Saques';

    protected static ?string $modelLabel = 'Saques';

    protected static ?string $navigationGroup = 'Administração';

    protected static ?string $slug = 'todos-saques';

    protected static ?int $navigationSort = 3;

    /**
     * @return string|null
     */
    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::where('status', 0)->count();
    }

    /**
     * @return string|array|null
     */
    public static function getNavigationBadgeColor(): string|array|null
    {
        return static::getModel()::where('status', 0)->count() > 5 ? 'success' : 'warning';
    }

    /**
     * @param Form $form
     * @return Form
     */
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Cadastro de Saques')
                    ->schema([
                        Forms\Components\Select::make('user_id')
                            ->label('Usuários')
                            ->placeholder('Selecione um usuário')
                            ->relationship(name: 'user', titleAttribute: 'name')
                            ->options(
                                fn($get) => User::query()
                                    ->pluck('name', 'id')
                            )
                            ->searchable()
                            ->preload()
                            ->live()
                            ->required(),
                        Forms\Components\TextInput::make('amount')
                            ->label('Valor')
                            ->required()
                            ->default(0.00),
                        Forms\Components\TextInput::make('type')
                            ->label('Tipo')
                            ->required()
                            ->maxLength(191),
                        Forms\Components\FileUpload::make('proof')
                            ->label('Comprovante')
                            ->placeholder('Carregue a imagem do comprovante')
                            ->image()
                            ->columnSpanFull()
                            ->required(),
                        Forms\Components\Toggle::make('status')
                            ->required(),
                    ])
            ]);
    }

    /**
     * @param Table $table
     * @return Table
     */
    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Nome')
                    ->sortable(),
                Tables\Columns\TextColumn::make('amount')
                    ->label('Valor')
                    ->money('BRL')
                    ->sortable(),
                Tables\Columns\TextColumn::make('type')
                    ->label('Tipo')
                    ->searchable(),
                Tables\Columns\TextColumn::make('chave_pix')
                    ->label('Chave Pix'),
                Tables\Columns\TextColumn::make('proof')
                    ->label('Comprovante')
                    ->html()
                    ->formatStateUsing(fn (string $state): string => '<a href="'.url('storage/'.$state).'" target="_blank">Baixar</a>'),
                Tables\Columns\IconColumn::make('status')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Data')
                    ->dateTime()
                    ->sortable(),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Action::make('approve_payment')
                    ->label('Fazer pagamento')
                    ->icon('heroicon-o-banknotes')
                    ->color('success')
                    ->visible(fn (Withdrawal $withdrawal): bool => !$withdrawal->status)
                    ->action(function(Withdrawal $withdrawal) {
                        \Filament\Notifications\Notification::make()
                            ->title('Saque')
                            ->success()
                            ->persistent()
                            ->body('Você está solicitando um saque de '. \Helper::amountFormatDecimal($withdrawal->amount))
                            ->actions([
                                \Filament\Notifications\Actions\Action::make('view')
                                    ->label('Confirmar')
                                    ->button()
                                    ->url(route('suitpay.withdrawal', ['id' => $withdrawal->id]))
                                    ->close(),
                                \Filament\Notifications\Actions\Action::make('undo')
                                    ->color('gray')
                                    ->label('Cancelar')
                                    ->action(function(Withdrawal $withdrawal) {

                                    })
                                    ->close(),
                            ])
                            ->send();
                    }),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make(),
            ]);
    }



    /**
     * @return array|\Filament\Resources\RelationManagers\RelationGroup[]|\Filament\Resources\RelationManagers\RelationManagerConfiguration[]|string[]
     */
    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListWithdrawals::route('/'),
            'create' => Pages\CreateWithdrawal::route('/create'),
            'edit' => Pages\EditWithdrawal::route('/{record}/edit'),
        ];
    }
}
