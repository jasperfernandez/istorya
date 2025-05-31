<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Api\RegisterRequest;

class RegisterController extends Controller
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
            'user' => UserResource::make($user->toArray()),
            'token' => $token,
        ], 201);
    }
}
