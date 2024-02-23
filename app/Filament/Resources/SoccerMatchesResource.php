<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SoccerMatchesResource\Pages;
use App\Models\Category;
use App\Models\SoccerCategory;
use App\Models\SoccerMatches;
use Filament\Forms;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SoccerMatchesResource extends Resource
{
    protected static ?string $model = SoccerMatches::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Futebol Partidas';

    protected static ?string $modelLabel = 'Futebol Partidas';

    protected static ?string $navigationGroup = 'Futebol';

    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                    ->schema([
                        Forms\Components\Group::make()
                        ->schema([
                            Forms\Components\Select::make('soccer_category_id')
                                ->label('Categoria')
                                ->placeholder('Selecione uma categoria')
                                ->relationship(name: 'soccerCategory', titleAttribute: 'name')
                                ->options(
                                    fn($get) => SoccerCategory::query()
                                        ->pluck('name', 'id')
                                )
                                ->searchable()
                                ->preload()
                                ->live(),
                            Forms\Components\TextInput::make('name')
                                ->label('Nome')
                                ->placeholder('Digite o nome do evento')
                                ->required()
                                ->maxLength(191),

                        ])->columns(2),
                        RichEditor::make('description')
                            ->label('Descrição')
                            ->columnSpanFull()
                            ->placeholder('Digite a descrição')->helperText('Você pode obter os dados aqui https://ge.globo.com/agenda'),
                    ]),

                Forms\Components\Section::make()
                    ->label('Time (A)')
                    ->description('Complete os campos para o Time (A)')
                    ->schema([
                        Forms\Components\Group::make()
                            ->schema([
                                Forms\Components\TextInput::make('team_a')
                                    ->label('Nome do Time (A)')
                                    ->placeholder('Digite o nome do time A')
                                    ->required()
                                    ->maxLength(191),
                                Forms\Components\TextInput::make('game_result_team_a')
                                    ->label('Resultado do Time (A)')
                                    ->placeholder('Digite o resultado do jogo do time A')
                                    ->helperText('Somente após a partida')
                                    ->default(0)
                                    ->numeric()
                                    ->maxLength(191),
                                Forms\Components\FileUpload::make('team_a_logo')
                                    ->label('Logo do Time (A)')
                                    ->directory('uploads')
                                    ->visibility('public')
                                    ->columnSpanFull(),
                            ])->columns(2),
                    ]),

                Forms\Components\Section::make()
                    ->label('Time (B)')
                    ->description('Complete os campos para o Time (B)')
                ->schema([
                    Forms\Components\Group::make()
                        ->schema([
                            Forms\Components\TextInput::make('team_b')
                                ->label('Nome do Time (B)')
                                ->placeholder('Digite o nome do time B')
                                ->required()
                                ->maxLength(191),
                            Forms\Components\TextInput::make('game_result_team_b')
                                ->helperText('Somente após a partida')
                                ->label('Resultado do Time (B)')
                                ->placeholder('Digite o resultado do jogo do time B')
                                ->default(0)
                                ->numeric()
                                ->maxLength(191),
                        ])->columns(2),

                    Forms\Components\FileUpload::make('team_b_logo')
                        ->label('Logo do Time (B)')
                        ->directory('uploads')
                        ->visibility('public')
                        ->columnSpanFull(),

                ]),
                Forms\Components\Section::make()
                ->schema([
                    Forms\Components\DateTimePicker::make('match_day')
                        ->label('Dia do jogo')
                        ->date()
                        ->required(),
                    Forms\Components\FileUpload::make('cover')
                        ->label('Capa do Jogo')
                        ->directory('uploads')
                        ->visibility('public')
                        ->columnSpanFull(),
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
                Tables\Columns\TextColumn::make('soccerCategory.name')
                    ->label('Categoria')
                    ->sortable(),
                Tables\Columns\ImageColumn::make('cover')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('name')
                    ->label('Titulo')
                    ->searchable(),
                Tables\Columns\TextColumn::make('description')
                    ->html()
                    ->limit(20)
                    ->toggleable(isToggledHiddenByDefault: true)
                    ->searchable(),
                Tables\Columns\ImageColumn::make('team_a_logo')
                    ->label('Logo (A)'),
                Tables\Columns\TextColumn::make('team_a')
                    ->label('Time (A)')
                    ->searchable(),
                Tables\Columns\TextColumn::make('game_result_team_a')
                    ->label('Resultado (A)')
                    ->searchable(),
                Tables\Columns\ImageColumn::make('team_b_logo')
                    ->label('Logo (B)'),
                Tables\Columns\TextColumn::make('team_b')
                    ->label('Time (B)')
                    ->searchable(),
                Tables\Columns\TextColumn::make('game_result_team_b')
                    ->label('Resultado (B)')
                    ->searchable(),
                Tables\Columns\TextColumn::make('match_day')
                    ->label('Dia')
                    ->dateTime('d/m/Y H:i')
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('concluded')
                    ->badge()
                    ->formatStateUsing(fn (string $state): string => \Helper::getMatcheResult($state))
                    ->color(fn (string $state): string => match ($state) {
                        "0" => 'warning',
                        "1" => 'success',
                    }),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\DeleteAction::make(),
                Tables\Actions\EditAction::make()->successRedirectUrl(url('admin/soccer-matches')),
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
            'index' => Pages\ListSoccerMatches::route('/'),
            'create' => Pages\CreateSoccerMatches::route('/create'),
            'edit' => Pages\EditSoccerMatches::route('/{record}/edit'),
        ];
    }
}
