<?php

declare(strict_types=1);

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin \App\Models\Message
 */
final class MessageResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'content' => $this->content,
            'is_read' => $this->is_read,

            'sent_by' => $this->sent_by,
            'conversation_id' => $this->conversation_id,

            'sender' => UserResource::make($this->whenLoaded('sender')),
            'conversation' => ConversationResource::make($this->whenLoaded('conversation')),
            'reads' => MessageReadResource::collection($this->whenLoaded('reads')),
        ];
    }
}
