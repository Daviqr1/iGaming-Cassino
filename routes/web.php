<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/test', function() {
    return view('emails.new-withdrawal', ['valor' => \Helper::amountFormatDecimal(150), 'usuario' => 'Victor']);
});

include_once(__DIR__ . '/groups/auth/login.php');
include_once(__DIR__ . '/groups/auth/social.php');
include_once(__DIR__ . '/groups/auth/register.php');

// PROVIDERS
include_once(__DIR__ . '/groups/provider/slotegrator.php');
include_once(__DIR__ . '/groups/provider/pragmatic.php');
include_once(__DIR__ . '/groups/provider/suitpay.php');

Route::prefix('painel')
    ->as('panel.')
    ->middleware(['auth'])
    ->group(function ()
    {
        include_once(__DIR__ . '/groups/panel/wallet.php');
        include_once(__DIR__ . '/groups/panel/bets.php');
        include_once(__DIR__ . '/groups/panel/profile.php');
        include_once(__DIR__ . '/groups/panel/notifications.php');
        include_once(__DIR__ . '/groups/panel/affiliates.php');
    });

Route::middleware(['web'])
    ->as('web.')
    ->group(function ()
    {
        include_once(__DIR__ . '/groups/web/home.php');
        include_once(__DIR__ . '/groups/web/game.php');
        include_once(__DIR__ . '/groups/web/category.php');
        include_once(__DIR__ . '/groups/web/bets.php');
        include_once(__DIR__ . '/groups/web/vgames.php');
		include_once(__DIR__ . '/groups/web/kscinus.php');
    });

URL::forceScheme('https');
