<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SoccerCategoryResource\Pages;
use App\Filament\Resources\SoccerCategoryResource\RelationManagers;
use App\Models\SoccerCategory;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SoccerCategoryResource extends Resource
{
    protected static ?string $model = SoccerCategory::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Futebol Categorias';

    protected static ?string $modelLabel = 'Futebol Categorias';

    protected static ?string $navigationGroup = 'Futebol';

    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                ->schema([
                    Forms\Components\Group::make()
                        ->schema([
                            Forms\Components\TextInput::make('name')
                                ->label('Nome do Evento')
                                ->placeholder('Digite sobre o evento, exp: Brasileirão')
                                ->required()
                                ->maxLength(191),
                            Forms\Components\TextInput::make('description')
                                ->label('Descrição do Evento')
                                ->placeholder('Digite e descrição do exemplo')
                                ->required()
                                ->maxLength(191),
                        ])->columns(2),
                    Forms\Components\FileUpload::make('image')
                        ->label('Icone')
                        ->directory('uploads')
                        ->visibility('public')
                        ->columnSpanFull()
                        ->image(),
                    Forms\Components\Toggle::make('active')
                        ->default(true)
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
            ->columns([
                Tables\Columns\ImageColumn::make('image'),
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\TextColumn::make('description')
                    ->searchable(),
                Tables\Columns\IconColumn::make('active')
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
                //
            ])
            ->actions([
                Tables\Actions\DeleteAction::make(),
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
            'index' => Pages\ListSoccerCategories::route('/'),
            'create' => Pages\CreateSoccerCategory::route('/create'),
            'edit' => Pages\EditSoccerCategory::route('/{record}/edit'),
        ];
    }
}
