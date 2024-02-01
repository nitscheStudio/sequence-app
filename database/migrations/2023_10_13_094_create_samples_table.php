<?php

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
        Schema::create('samples', function (Blueprint $table) {
            $table->id();
            $table->string('title', 255);
            $table->integer('bpm')->unsigned(); // range between 40 and 240
            $table->string('key'); // Key from config, e.g. A, B, C...
            $table->string('scale'); // Scale from config, e.g. Major, Minor...
            $table->enum('type', ['loop', 'one-shot']); // 'loop' or 'one-shot'
            $table->foreignId('genre_id')->constrained()->onDelete('cascade');
            $table->foreignId('instrument_id')->constrained()->onDelete('cascade');
            $table->string('file_path');
            $table->foreignId('user_id')->constrained()->onDelete('cascade'); // If you want to associate samples with users.
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('samples');
    }
};
