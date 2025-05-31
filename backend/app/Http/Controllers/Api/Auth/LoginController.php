<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\LoginRequest;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class LoginController extends Controller
{
    public function __invoke(LoginRequest $request)
    {
        $validated = $request->validated();

        $user = User::where('email', $validated['email'])->first();

        if (!$user) {
            return response()->json([
                'errors' => [
                    'email' => ['Account not found.'],
                ],
            ], 422);
        }

        if (!$user || !Hash::check($validated['password'], $user->password)) {
            return response()->json([
                'errors' => [
                    'email' => ['Password incorrect.'],
                ],
            ], 422);
        }

        $token = $user->createToken($user->name)->plainTextToken;

        return response()->json([
            'message' => 'Logged in.',
            'user' => [
                'id' => $user->id,
                'token' => $token,
                'name' => $user->name,
                'email' => $user->email,
            ],
        ], 200);
    }
}
