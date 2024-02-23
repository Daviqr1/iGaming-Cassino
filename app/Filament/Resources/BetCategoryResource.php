<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BetCategoryResource\Pages;
use App\Filament\Resources\BetCategoryResource\RelationManagers;
use App\Models\BetCategory;
use App\Models\BetSection;
use App\Models\Category;
use Filament\Forms;
use Filament\Forms\Components\RichEditor;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BetCategoryResource extends Resource
{
    protected static ?string $model = BetCategory::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Apostas Categorias';

    protected static ?string $modelLabel = 'Apostas Categorias';

    protected static ?string $navigationGroup = 'Apostas';

    protected static ?int $navigationSort = 1;

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
                                Forms\Components\TextInput::make('name')
                                    ->label('Nome do Evento')
                                    ->placeholder('Digite sobre o evento, exp: Brasileirão')
                                    ->required()
                                    ->maxLength(191),
                                Forms\Components\Select::make('bet_section_id')
                                    ->label('Sessão')
                                    ->placeholder('Selecione uma Sessão')
                                    ->relationship(name: 'betSection', titleAttribute: 'name')
                                    ->options(
                                        fn($get) => BetSection::query()
                                            ->pluck('name', 'id')
                                    )
                                    ->searchable()
                                    ->preload()
                                    ->live(),
                                RichEditor::make('description')
                                    ->label('Descrição do Evento')
                                    ->placeholder('Digite e descrição do exemplo')
                                    ->required()
                                    ->columnSpanFull()
                                ,
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
                Tables\Columns\ImageColumn::make('image')
                    ->label('Capa'),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nome')
                    ->searchable(),
                Tables\Columns\TextColumn::make('betCategory.name')
                    ->label('Subcategoria')
                ,
                Tables\Columns\IconColumn::make('active')
                    ->label('Status')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label('Data')
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

    /**
     * @return array|\Filament\Resources\RelationManagers\RelationGroup[]|\Filament\Resources\RelationManagers\RelationManagerConfiguration[]|string[]
     */
    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    /**
     * @return array|\Filament\Resources\Pages\PageRegistration[]
     */
    public static function getPages(): array
    {
        return [
            'index' => Pages\ListBetCategories::route('/'),
            'create' => Pages\CreateBetCategory::route('/create'),
            'edit' => Pages\EditBetCategory::route('/{record}/edit'),
        ];
    }
}
