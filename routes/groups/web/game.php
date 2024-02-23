<?php

use App\Http\Controllers\Web\GameController;
use Illuminate\Support\Facades\Route;

Route::get('/game/{slug}', [GameController::class, 'index'])->name('game.index');
Route::get('/games', [GameController::class, 'getListGame'])->name('game.list');
