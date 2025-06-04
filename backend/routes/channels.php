<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('conversation.{conversationId}', function ($user, $conversationId) {
    return DB::table('conversation_user')
        ->where('conversation_id', $conversationId)
        ->where('user_id', $user->id)
        ->exists();
});
