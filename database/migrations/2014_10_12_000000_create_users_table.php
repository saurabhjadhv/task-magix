<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create(
            'users', function (Blueprint $table){
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->string('type', 20)->default('user');
            $table->string('avatar')->nullable();
            $table->integer('created_by')->default(0);
            $table->string('phone', 20)->nullable();
            $table->date('dob')->nullable();
            $table->string('gender', 10)->nullable();
            $table->text('skills')->nullable();
            $table->integer('is_active')->default(1);
            $table->integer('is_invited')->default(0);
            $table->string('lang', 5)->default('en');
            $table->text('facebook')->nullable();
            $table->text('whatsapp')->nullable();
            $table->text('instagram')->nullable();
            $table->text('likedin')->nullable();
            $table->string('mode', 6)->default('light');
            $table->smallInteger('is_trial_done')->default(0);
            $table->smallInteger('is_plan_purchased')->default(0);
            $table->smallInteger('interested_plan_id')->default(0);
            $table->smallInteger('is_register_trial')->default(0);
            $table->integer('plan')->nullable();
            $table->date('plan_expire_date')->nullable();
            $table->float('storage_limit')->default(0);
            $table->string('payment_subscription_id', 100)->nullable();
            $table->text('details')->nullable();
            $table->rememberToken();
            $table->datetime('last_login_at')->nullable();
            $table->boolean('active_status')->default(0);
            $table->boolean('dark_mode')->default(0);
            $table->string('messenger_color')->default('#2180f3');
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
        Schema::dropIfExists('users');
    }
}
