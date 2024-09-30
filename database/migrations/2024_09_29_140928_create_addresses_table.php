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
        Schema::create('addresses', function (Blueprint $table) {
            $table->id();
            $table->string('label_name');
            $table->string('recipient_name');
            $table->char('phone_number', 13);
            $table->foreignId('province_id')->constrained('raja_ongkir_provinces')->onDelete('cascade');
            $table->foreignId('city_id')->constrained('raja_ongkir_cities')->onDelete('cascade');
            $table->text('address');
            $table->text('note_for_courier')->nullable();
            $table->boolean('is_default')->default(false);
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('addresses');
    }
};
