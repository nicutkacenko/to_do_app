<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/todocomponents', [ToDoComponentController::class, 'index']);
Route::post('/todocomponents', [ToDoComponentController::class, 'store']);
Route::get('/todocomponents/{todocomponent}', [ToDoComponentController::class, 'show']);
Route::put('/todocomponents/{todocomponent}', [ToDoComponentController::class, 'update']);
Route::delete('/todocomponents/{todocomponent}', [ToDoComponentController::class, 'destroy']);

