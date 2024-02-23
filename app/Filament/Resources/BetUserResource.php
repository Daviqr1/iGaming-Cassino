<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BetUserResource\Pages;
use App\Filament\Resources\BetUserResource\RelationManagers;
use App\Models\BetEvent;
use App\Models\BetUser;
use App\Models\User;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BetUserResource extends Resource
{
    protected static ?string $model = BetUser::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Apostas do Usuário';

    protected static ?string $modelLabel = 'Apostas do Usuário';

    protected static ?string $navigationGroup = 'Apostas';

    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                ->schema([
                    Forms\Components\Group::make()
                        ->schema([
                            Forms\Components\Select::make('bet_event_id')
                                ->label('Evento')
                                ->placeholder('Selecione uma evento')
                                ->relationship(name: 'event', titleAttribute: 'name')
                                ->options(
                                    fn($get) => BetEvent::query()
                                        ->pluck('name', 'id')
                                )
                                ->searchable()
                                ->preload()
                                ->live(),
                            Forms\Components\Select::make('user_id')
                                ->label('Usuário')
                                ->placeholder('Selecione um usuário')
                                ->relationship(name: 'user', titleAttribute: 'name')
                                ->options(
                                    fn($get) => User::query()
                                        ->pluck('name', 'id')
                                )
                                ->searchable()
                                ->preload()
                                ->live(),
                        ])->columns(2),
                    Forms\Components\Group::make()
                        ->schema([
                            Forms\Components\TextInput::make('amount')
                                ->label('Valor')
                                ->required()
                                ->numeric()
                                ->default(0.00),
                            Forms\Components\TextInput::make('event_result_a')
                                ->label('Resultado (A)')
                                ->placeholder('Qual é a sua previsão para o resultado do jogo?')
                                ->required()
                                ->maxLength(191),
                            Forms\Components\TextInput::make('event_result_b')
                                ->label('Resultado (B)')
                                ->placeholder('Qual é a sua previsão para o resultado do jogo?')
                                ->required()
                                ->maxLength(191),
                        ])->columns(3),

                    Forms\Components\Toggle::make('winner')
                        ->label('Vencedor')
                        ->required(),
                ])
            ]);
    }

    /**
     * @param Table $table
     * @return Table
     * @throws \Exception
     */
    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('event.name')
                    ->label('Aposta')
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Apostador')
                    ->sortable(),
                Tables\Columns\TextColumn::make('amount')
                    ->label('Valor')
                    ->money('BRL')
                    ->sortable(),
                Tables\Columns\TextColumn::make('bet_result_team_a')
                    ->label('Resultado')
                    ->state(fn (BetUser $record): string => $record->event_result_a.'x'.$record->event_result_b)
                ,
                Tables\Columns\IconColumn::make('winner')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Filter::make('created_at')
                    ->form([
                        DatePicker::make('created_from')->label('Criado em'),
                        DatePicker::make('created_until')->label('Criado até'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['created_from'],
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '>=', $date),
                            )
                            ->when(
                                $data['created_until'],
                                fn (Builder $query, $date): Builder => $query->whereDate('created_at', '<=', $date),
                            );
                    })
                    ->indicateUsing(function (array $data): array {
                        $indicators = [];

                        if ($data['created_from'] ?? null) {
                            $indicators['created_from'] = 'Criado em ' . Carbon::parse($data['created_from'])->toFormattedDateString();
                        }

                        if ($data['created_until'] ?? null) {
                            $indicators['created_until'] = 'Criado até ' . Carbon::parse($data['created_until'])->toFormattedDateString();
                        }

                        return $indicators;
                    })
            ])
            ->actions([
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

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBetUsers::route('/'),
            'create' => Pages\CreateBetUser::route('/create'),
            'edit' => Pages\EditBetUser::route('/{record}/edit'),
        ];
    }
}
