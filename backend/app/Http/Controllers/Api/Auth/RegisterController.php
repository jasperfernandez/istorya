<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\RegisterRequest;
use App\Models\User;
use Storage;

class RegisterController extends Controller
{
    public function __invoke(RegisterRequest $request)
    {
        $validated = $request->validated();

        try {
            // if ($request->hasFile('profile')) {
            //     $validated['profile'] = Storage::disk('public')->put('profiles', $validated['profile']);
            // }

            $user = User::create([
                'name' => $validated['name'],
                'email' => $validated['email'],
                'password' => $validated['password'],
                // 'profile' => $validated['profile'],
            ]);

            $token = $user->createToken($user->name)->plainTextToken;

            return response()->json([
                'message' => 'Account created.',
                'user' => [
                    'id' => $user->id,
                    'token' => $token,
                    'name' => $user->name,
                    'email' => $user->email,
                    // 'profile' => Storage::disk('public')->url($user->profile),
                ],
            ], 201);
        } catch (\Throwable $th) {
            \Log::error('Registration error: ' . $th->getMessage());
            return response()->json([
                'message' => $th->getMessage(),
            ], 500);
        }

    }
}
