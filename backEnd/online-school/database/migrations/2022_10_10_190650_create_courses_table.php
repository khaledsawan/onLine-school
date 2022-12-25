<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCoursesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('courses', function (Blueprint $table) {
            $table->id();
            $table->longText('img');
            $table->string('name');
            $table->string('category');
            $table->string('expected_time_to_finsh');
            $table->unsignedInteger('teacher_id');
            $table->foreign('teacher_id')->references('id')->on('users');
            $table->integer('viewer_quntity')->default(0);
            $table->integer('number_of_videos')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('courses');
    }
}
