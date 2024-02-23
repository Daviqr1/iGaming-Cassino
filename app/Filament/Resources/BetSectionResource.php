<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BetSectionResource\Pages;
use App\Filament\Resources\BetSectionResource\RelationManagers;
use App\Models\BetSection;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BetSectionResource extends Resource
{
    protected static ?string $model = BetSection::class;

    protected static ?string $navigationIcon    = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel   = 'Apostas Sessão';

    protected static ?string $pluralLabel       = '';
    protected static ?string $pluralModelLabel  = '';

    protected static ?string $modelLabel = 'Tipo de Apostas';

    protected static ?string $navigationGroup = 'Apostas';

    protected static ?int $navigationSort = -1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Section::make()
                ->schema([
                    Forms\Components\TextInput::make('name')
                        ->label('Nome')
                        ->placeholder('Digite o nome da sessão: Tipo Futebol')
                        ->required()
                        ->maxLength(191),
                    Forms\Components\FileUpload::make('image')
                        ->image()
                        ->required(),
                    Forms\Components\Toggle::make('active')
                        ->label('Ativar')
                        ->required()
                        ->default(true)
                        ->columnSpanFull(),
                ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),
                Tables\Columns\ImageColumn::make('image'),
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
            'index' => Pages\ListBetSections::route('/'),
            'create' => Pages\CreateBetSection::route('/create'),
            'edit' => Pages\EditBetSection::route('/{record}/edit'),
        ];
    }
}
