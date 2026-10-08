<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminCanteenController;
use App\Http\Controllers\StudentCanteenController;
use App\Http\Middleware\RoleMiddleware;

Route::get('/', function () {
    return view('welcome');
});

Route::middleware(['auth'])->group(function () {
    Route::middleware(['role:admin'])->prefix('admin')->name('admin.')->group(function () {
        Route::get('/dashboard', [AdminCanteenController::class, 'index'])->name('dashboard');
        Route::post('/qris', [AdminCanteenController::class, 'updateQris'])->name('qris.update');
        Route::patch('/order/{id}/verify', [AdminCanteenController::class, 'verifyOrder'])->name('order.verify');
        Route::post('/menu', [AdminCanteenController::class, 'storeMenu'])->name('menu.store');
    });

    Route::middleware(['role:student'])->prefix('student')->name('student.')->group(function () {
        Route::get('/dashboard', [StudentCanteenController::class, 'index'])->name('dashboard');
        Route::post('/checkout', [StudentCanteenController::class, 'checkout'])->name('checkout');
    });
});

if (file_exists(__DIR__.'/auth.php')) {
    require __DIR__.'/auth.php';
}
