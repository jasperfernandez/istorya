<?php

declare(strict_types=1);

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('message_reads', function(Blueprint $table) {
            $table->id();
            $table->timestamp('read_at')->nullable();
            $table->foreignId('message_id')->constrained()->cascadeOnDelete();
            $table->foreignId('read_by')->constrained('users')->cascadeOnDelete();
            $table->unique(['message_id', 'read_by']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('message_reads');
    }
};
