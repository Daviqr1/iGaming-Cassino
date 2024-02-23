<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SoccerBetsResource\Pages;
use App\Filament\Resources\SoccerBetsResource\Widgets\BetsOverview;
use App\Models\SoccerBets;
use App\Models\SoccerMatches;
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

class SoccerBetsResource extends Resource
{
    protected static ?string $model = SoccerBets::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Futebol Apostas';

    protected static ?string $modelLabel = 'Futebol Apostas';

    protected static ?string $navigationGroup = 'Futebol';

    protected static ?int $navigationSort = 3;

    /**
     * @param Form $form
     * @return Form
     */
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make('Apostas')
                    ->description('Faça suas apostas aqui')
                    ->schema([
                        Forms\Components\Group::make()
                        ->schema([
                            Forms\Components\Select::make('soccer_matche_id')
                                ->label('Partida')
                                ->placeholder('Selecione uma partida')
                                ->relationship(name: 'matche', titleAttribute: 'name')
                                ->options(
                                    fn($get) => SoccerMatches::query()
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
                                Forms\Components\TextInput::make('bet_result_team_a')
                                    ->label('Resultado (A)')
                                    ->placeholder('Qual é a sua previsão para o resultado do jogo?')
                                    ->required()
                                    ->maxLength(191),
                                Forms\Components\TextInput::make('bet_result_team_b')
                                    ->label('Resultado (B)')
                                    ->placeholder('Qual é a sua previsão para o resultado do jogo?')
                                    ->required()
                                    ->maxLength(191),
                                Forms\Components\Toggle::make('winner')
                                    ->label('Vencedor')
                                    ->required(),
                            ])->columns(3),
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
            ->columns([
                Tables\Columns\TextColumn::make('matche.name')
                    ->label('Aposta')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Usuário')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('amount')
                    ->label('Valor')
                    ->money('BRL')
                    ->sortable(),
                Tables\Columns\TextColumn::make('bet_result_team_a')
                    ->label('Resultado')
                    ->state(fn (SoccerBets $record): string => $record->bet_result_team_a.'x'.$record->bet_result_team_b)
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
//                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
//                Tables\Actions\BulkActionGroup::make([
//                    Tables\Actions\DeleteBulkAction::make(),
//                ]),
            ])
            ->emptyStateActions([
                Tables\Actions\CreateAction::make()->successRedirectUrl(route('filament.admin.resources.soccer-bets.index'))
            ]);
    }

    /**
     * @return string[]
     */
    public static function getWidgets(): array
    {
        return [
            BetsOverview::class
        ];
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
            'index' => Pages\ListSoccerBets::route('/'),
            'create' => Pages\CreateSoccerBets::route('/create'),
            //'edit' => Pages\EditSoccerBets::route('/{record}/edit'),
        ];
    }
}
