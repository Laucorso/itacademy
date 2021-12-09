<?php

use App\Http\Controllers\JugadorController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
})->name('welcome');


require __DIR__.'/auth.php';

Route::middleware(['auth'])->group(function () {  

    Route::get('/dashboard', [jugadorController::class, 'index'])->name('dashboard');
    Route::get('/jugadors', [jugadorController::class, 'index'])->name('jugadors.index');
    Route::get('/jugadors/create', [JugadorController::class, 'create'])->name('jugadors.create');
    Route::post('/jugadors', [JugadorController::class, 'store'])->name('jugadors.store');
    Route::put('/jugadors/{id}', [JugadorController::class, 'update'])->name('jugadors.update');
    Route::get('/jugadors/edit/{id}', [JugadorController::class, 'edit'])->name('jugadors.edit');
    Route::delete('/jugadors/delete/{jugador}', [JugadorController::class, 'destroy'])->name('jugadors.delete');
    Route::get('/jugadors/show/{id}', [JugadorController::class, 'show'])->name('jugadors.show');

});
