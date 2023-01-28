<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

        Schema::create('todocomponents', function (Blueprint $table) {
            /* the primary key of the todocomponent*/
            $table->increments('id');

            /*the title of the todocomponent*/
            $table->string('title');

            /*the description of the todocomponent*/
            $table->string('description');

            /*the priority of the todocomponent*/
            $table->string('priority');

            /*the image_url of the todocomponent*/
            $table->string('image_url');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('todocomponents');
    }
};
