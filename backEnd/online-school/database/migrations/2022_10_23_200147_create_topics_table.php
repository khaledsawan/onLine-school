<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTopicsTable extends Migration
{
    public function up()
    {
        Schema::create('topics', function (Blueprint $table) {
            $table->id();
            $table->integer('t_id');
            $table->integer('s_id');
        });
    }

    public function down()
    {
        Schema::dropIfExists('topics');
    }
}
