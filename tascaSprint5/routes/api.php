<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('/jugadors', [JugadorController::class, 'index']);
Route::post('/jugadors', [JugadorController::class, 'store']);
Route::put('/jugadors/{id}', [JugadorController::class, 'update']);
Route::get('/jugadors/ranking', [JugadorController::class, 'ranking']);
Route::get('/jugadors/ranking/loser', [JugadorController::class, 'rankingLoser']);
Route::get('/jugadors/ranking/winner', [JugadorController::class, 'rankingWinner']);



Route::get('/jugadors/games', [PartidaController::class, 'index']);
Route::post('/jugadors/{id}/games', [PartidaController::class, 'tirada']);
Route::delete('/jugadors/{id}/games', [PartidaController::class, 'delete']);

