<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePlansTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create(
            'plans', function (Blueprint $table){
            $table->id();
            $table->string('name', 100)->unique();
            $table->float('storage_limit')->default(0);
            $table->float('monthly_price' ,15, 2)->default(0);
            $table->float('annual_price' ,15, 2)->default(0);
            $table->integer('status')->default(0);
            $table->string('enable_chatgpt')->default('off');
            $table->string('trial_days', 100);
            $table->integer('max_users')->default(0);
            $table->integer('max_projects')->default(0);
            $table->text('description')->nullable();
            $table->timestamps();
        }
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('plans');
    }
}
