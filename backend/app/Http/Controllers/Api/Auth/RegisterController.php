<?php

declare(strict_types=1);

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\RegisterRequest;
use App\Models\User;
use Illuminate\Support\Facades\Storage;

final class RegisterController extends Controller
{
    public function __invoke(RegisterRequest $request)
    {
        $validated = $request->validated();

        if ($request->hasFile('profile')) {
            $validated['profile'] = Storage::disk('public')->put('profiles', $validated['profile']);
        }

        $user = User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'password' => $validated['password'],
            'profile' => $validated['profile'],
        ]);

        $token = $user->createToken($user->name)->plainTextToken;

        return response()->json([
            'message' => 'Account created.',
            'user' => $user->toResource(),
            'token' => $token,
        ], 201);
    }
}
