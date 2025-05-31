<?php

namespace App\Http\Controllers\Api;

use App\Models\Conversation;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use App\Http\Controllers\Controller;

class ConversationStartController extends Controller
{
    public function __invoke(Request $request)
    {
        $validated = $request->validate([
            'message' => ['nullable', 'string'],
            'name' => ['nullable', 'string', 'max:50'],
            'type' => ['required', 'string', Rule::in(['private', 'group'])],
            'receiver_ids' => ['required', 'array'],
            'receiver_ids.*' => ['required', 'integer', Rule::exists('users', 'id')],
        ]);

        $conversation = Conversation::create([
            'name' => $validated['name'],
            'type' => $validated['type'],
            'created_by' => $request->user()->id,
        ]);

        if ($validated['message']) {
            $conversation->messages()->create([
                'content' => $validated['message'],
                'is_read' => true,
                'sent_by' => $request->user()->id,
            ]);
        }

        $conversation->users()->attach(array_merge($validated['receiver_ids'], [$request->user()->id]));

        return response()->json([
            'message' => 'Message sent.',
            'conversation' => $conversation
                ->load(['creator', 'users'])
                ->toResource(),
        ], 201);
    }
}
