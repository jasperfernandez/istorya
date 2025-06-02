<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\Api\LoginRequest;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
    public function __invoke(LoginRequest $request)
    {
        $validated = $request->validated();

        $user = User::where('email', $validated['email'])->first();

        if (!$user) {
            throw ValidationException::withMessages([
                'email' => ['Account not found.'],
            ]);
        }

        if (!$user || !Hash::check($validated['password'], $user->password)) {
            throw ValidationException::withMessages([
                'password' => ['Password incorrect.'],
            ]);
        }

        $token = $user->createToken($user->name)->plainTextToken;

        return response()->json([
            'message' => 'Logged in.',
            'user' => $user->toResource(),
            'token' => $token,
        ], 200);
    }
}
