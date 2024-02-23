<?php

use App\Http\Controllers\Web\BetController;
use Illuminate\Support\Facades\Route;

Route::prefix('bets')
    ->as('bets.')
    ->group(function ()
    {
        Route::get('/', [BetController::class, 'index'])->name('index');
        Route::get('/{id}', [BetController::class, 'show'])->name('show');
        Route::post('/store', [BetController::class, 'store'])->name('store');
    });

