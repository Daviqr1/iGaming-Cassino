<?php

use App\Http\Controllers\Panel\BetController;
use Illuminate\Support\Facades\Route;

Route::prefix('bets')
    ->as('bets.')
    ->group(function ()
    {
        Route::get('/', [BetController::class, 'index'])->name('index');
    });
