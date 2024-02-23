<?php


use App\Http\Controllers\Gateway\SuitPayController;

Route::post('suitpay/qrcode-pix', [SuitPayController::class, 'getQRCodePix']);
Route::post('suitpay/consult-status-transaction', [SuitPayController::class, 'consultStatusTransactionPix']);
Route::any('suitpay/callback', [SuitPayController::class, 'callbackMethod']);
Route::any('suitpay/payment', [SuitPayController::class, 'callbackMethodPayment']);


Route::get('suitpay/withdrawal/{id}', [SuitPayController::class, 'withdrawalFromModal'])->name('suitpay.withdrawal');
