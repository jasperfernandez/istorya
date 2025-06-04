<?php

declare(strict_types=1);

use App\Http\Controllers\Api\Auth\LoginController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\ConversationStartController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

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
    Route::get('/user', fn (Request $request) => $request->user());

    // Conversations
    Route::post('/conversations/start', ConversationStartController::class);
});
