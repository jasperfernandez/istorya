<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin \App\Models\MessageRead
 */
class MessageReadResource extends JsonResource
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
            'read_at' => $this->read_at,

            'message_id' => $this->message_id,
            'read_by' => $this->read_by,

            'message' => MessageResource::make($this->whenLoaded('message')),
            'reader' => UserResource::make($this->whenLoaded('reader')),
        ];
    }
}
