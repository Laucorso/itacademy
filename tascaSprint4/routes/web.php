<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\JugadorController;

Route::get('/', function () {
    return view('');
});
Route::resource('jugadors', JugadorController::class);
Route::get('/jugadors', [jugadorController::class, 'index'])->name('jugadors.index');
Route::get('/jugadors/create', [JugadorController::class, 'create'])->name('jugadors.create');
Route::post('/jugadors', [JugadorController::class, 'store'])->name('jugadors.store');
Route::put('/jugadors', [JugadorController::class, 'update'])->name('jugadors.update');
Route::get('/jugadors/edit/{id}', [JugadorController::class, 'edit'])->name('jugadors.edit');
Route::delete('/jugadors/delete/{jugador}', [JugadorController::class, 'destroy'])->name('jugadors.delete');

