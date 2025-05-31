<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\ConversationStartController;

Broadcast::routes(['middleware' => ['auth:sanctum']]);

// Login
Route::post('/login', LoginController::class);

// Register
Route::post('/register', RegisterController::class);

// Logout
Route::post('/logout', LogoutController::class)
    ->middleware('auth:sanctum');

Route::middleware('auth:sanctum')->group(function () {
    // User
    Route::get('/user', fn(Request $request) => $request->user());

    // Conversations
    Route::post('/conversations/start', ConversationStartController::class);
});
