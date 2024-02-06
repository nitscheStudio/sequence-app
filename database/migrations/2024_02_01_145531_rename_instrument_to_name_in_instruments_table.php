<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('instruments', function (Blueprint $table) {
            $table->renameColumn('instrument', 'name');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('instruments', function (Blueprint $table) {
            $table->renameColumn('name', 'instrument');
        });
    }
};
