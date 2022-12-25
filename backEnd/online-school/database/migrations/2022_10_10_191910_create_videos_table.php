<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVideosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('videos', function (Blueprint $table) {
            $table->id();
            $table->longText('img');
            $table->longText('url');
            $table->longText('descirption');
            $table->string('name');
            $table->foreign('teacher_id')->references('id')->on('users');
            $table->unsignedInteger('teacher_id');
            $table->foreign('course_id')->references('id')->on('courses');
            $table->unsignedBigInteger('course_id');
            $table->integer('viewer_quntity')->default(0);
            $table->boolean('isIntro')->default(0);
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
        Schema::dropIfExists('videos');
    }
}
