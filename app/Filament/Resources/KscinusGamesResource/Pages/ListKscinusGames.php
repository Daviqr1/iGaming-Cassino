<?php

namespace App\Filament\Resources\KscinusGamesResource\Pages {

	use App\Filament\Resources\KscinusGamesResource;
	use Filament\Actions;
	use Filament\Resources\Pages\ListRecords;
	use App\Http\Controllers\Provider\KscinusController;
	use App\Models\Category;
	use App\Models\GamesKscinus;

	use function PHPUnit\Framework\fileExists;

	class ListKscinusGames extends ListRecords
	{
		protected static string $resource = KscinusGamesResource::class;

		protected function getHeaderActions(): array
		{
			return [
				Actions\CreateAction::make(),
				Actions\Action::make('import')
					->label('Importar Jogos Kscinus')
					->action(function () {
						$kc = new KscinusController();
						$games = $kc->ListGames();
						foreach ($games['data'] as $game) {
							$category = Category::where('slug', $game['genere'])->first();
							$g = GamesKscinus::where('key', $game['key'])->first();
							$cover = NULL;
							if (isset($game['cover'])) {
								$cover = $game['cover'];
							} else {
								$temp = strtolower($game['developer']) . DIRECTORY_SEPARATOR . $game['key'] . '.jpg';
								if (fileExists(__DIR__ . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . DIRECTORY_SEPARATOR . '..' . 'public' . DIRECTORY_SEPARATOR . 'storage' . DIRECTORY_SEPARATOR . $temp)) {
									$cover = str_replace(DIRECTORY_SEPARATOR, '/', $temp);
								}
							}

							if ($g) {
								$g->category_id = $category?->id ?? 0;
								$g->cover = $cover;
								$game['views'] = $g->views;
								$g->update($game);
							} else {
								$game['category_id'] = $category?->id ?? 0;
								$game['cover'] = $cover;
								GamesKscinus::create($game);
							}
						}
					})
			];
		}
	}
}
