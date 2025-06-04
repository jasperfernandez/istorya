<?php

declare(strict_types=1);

use App\Events\MessageSent;
use App\Models\Message;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    $message = Message::create([
        'content' => 'TRYYY...',
        'is_read' => true,
        'conversation_id' => 1,
        'sent_by' => 1,
    ]);

    broadcast(new MessageSent($message));

    return 'done';
});
