<?php

use App\Http\Controllers\Provider\KscinusController;
use Illuminate\Support\Facades\Route;

Route::prefix('kgames')
	->as('kscinus.')
	->group(function () {
		Route::get('/{game}/view', [KscinusController::class, 'Show'])->name('show');
		Route::get('/{game}/pre', [KscinusController::class, 'PrePlay'])->name('go');
		Route::get('/{game}/play', [KscinusController::class, 'Play'])->name('play');
		Route::post('/callback', [KscinusController::class, 'Callback'])->name('callback');
		Route::get('/callback', [KscinusController::class, 'CallbackRedirect'])->name('callback.redirect');
	});
