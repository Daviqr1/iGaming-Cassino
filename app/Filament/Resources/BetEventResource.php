<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BetEventResource\Pages;
use App\Filament\Resources\BetEventResource\RelationManagers;
use App\Models\BetCategory;
use App\Models\BetEvent;
use Filament\Forms;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BetEventResource extends Resource
{
    protected static ?string $model = BetEvent::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Apostas Eventos';

    protected static ?string $modelLabel = 'Apostas Eventos';

    protected static ?string $navigationGroup = 'Apostas';

    protected static ?int $navigationSort = 2;

    /**
     * @param Form $form
     * @return Form
     */
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                    ->schema([
                        Forms\Components\Group::make()
                            ->schema([
                                Forms\Components\Select::make('bet_category_id')
                                    ->label('Categoria')
                                    ->placeholder('Selecione uma categoria')
                                    ->relationship(name: 'betCategory', titleAttribute: 'name')
                                    ->options(
                                        fn($get) => BetCategory::query()
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
                    ->label('Evento (A)')
                    ->description('Complete os campos para o Evento (A)')
                    ->schema([
                        Forms\Components\Group::make()
                            ->schema([
                                Forms\Components\TextInput::make('event_a')
                                    ->label('Nome do Time\Participante\Equipe (A)')
                                    ->placeholder('Digite o nome do time, participante ou equipe A')
                                    ->required()
                                    ->maxLength(191),
                                Forms\Components\TextInput::make('event_result_a')
                                    ->label('Resultado do Time\Participante\Equipe (A)')
                                    ->placeholder('Digite o resultado do evento A')
                                    ->helperText('Somente após a evento')
                                    ->default(0)
                                    ->numeric()
                                    ->maxLength(191),
                                Forms\Components\FileUpload::make('event_a_logo')
                                    ->label('Imagem/Logo do evento (A)')
                                    ->directory('uploads')
                                    ->visibility('public')
                                    ->columnSpanFull(),
                            ])->columns(2),
                    ]),

                Forms\Components\Section::make()
                    ->label('Evento (B)')
                    ->description('Complete os campos para o Evento (B)')
                    ->schema([
                        Forms\Components\Group::make()
                            ->schema([
                                Forms\Components\TextInput::make('event_b')
                                    ->label('Nome do Time\Participante\Equipe (B)')
                                    ->placeholder('Digite o nome do time, participante ou equipe B')
                                    ->required()
                                    ->maxLength(191),
                                Forms\Components\TextInput::make('event_result_b')
                                    ->label('Resultado do Time\Participante\Equipe (B)')
                                    ->placeholder('Digite o resultado do evento B')
                                    ->helperText('Somente após a evento')
                                    ->default(0)
                                    ->numeric()
                                    ->maxLength(191),
                                Forms\Components\FileUpload::make('event_b_logo')
                                    ->label('Imagem/Logo do evento (B)')
                                    ->directory('uploads')
                                    ->visibility('public')
                                    ->columnSpanFull(),
                            ])->columns(2),
                    ]),
                Forms\Components\Section::make()
                    ->schema([
                        Forms\Components\FileUpload::make('cover')
                            ->label('Capa do Evento')
                            ->directory('uploads')
                            ->visibility('public')
                            ->columnSpanFull(),
                        Forms\Components\DateTimePicker::make('event_day')
                            ->label('Dia do Evento')
                            ->date()
                            ->columnSpanFull()
                            ->required(),
                        Forms\Components\Toggle::make('finished')
                            ->columnSpanFull()
                            ->label('Finalizado?'),
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
            ->defaultSort('event_day', 'desc')
            ->columns([
                Tables\Columns\TextColumn::make('betCategory.name')
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
                Tables\Columns\ImageColumn::make('event_a_logo')
                    ->label('Logo (A)'),
                Tables\Columns\TextColumn::make('event_a')
                    ->label('Time (A)')
                    ->searchable(),
                Tables\Columns\TextColumn::make('event_result_a')
                    ->label('Resultado (A)')
                    ->searchable(),
                Tables\Columns\ImageColumn::make('event_b_logo')
                    ->label('Logo (B)'),
                Tables\Columns\TextColumn::make('event_b')
                    ->label('Time (B)')
                    ->searchable(),
                Tables\Columns\TextColumn::make('event_result_b')
                    ->label('Resultado (B)')
                    ->searchable(),
                Tables\Columns\TextColumn::make('event_day')
                    ->label('Dia')
                    ->dateTime('d/m/Y H:i')
                    ->sortable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('finished')
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
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make()->successRedirectUrl(url('admin/bet-events')),
                Tables\Actions\DeleteAction::make(),
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
            RelationManagers\BetsRelationManager::class
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBetEvents::route('/'),
            'create' => Pages\CreateBetEvent::route('/create'),
            'view' => Pages\ViewBetEvent::route('/{record}/view'),
            'edit' => Pages\EditBetEvent::route('/{record}/edit'),
        ];
    }
}
