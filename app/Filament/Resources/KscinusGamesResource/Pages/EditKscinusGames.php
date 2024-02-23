<?php

namespace App\Filament\Resources\KscinusGamesResource\Pages {

	use App\Filament\Resources\KscinusGamesResource;
	use Filament\Actions;
	use Filament\Resources\Pages\EditRecord;

	class EditKscinusGames extends EditRecord
	{
		protected static string $resource = KscinusGamesResource::class;

		protected function getHeaderActions(): array
		{
			return [
				Actions\DeleteAction::make(),
			];
		}
	}
}
