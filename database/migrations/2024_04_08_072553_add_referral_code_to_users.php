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
        if (!Schema::hasColumn('users', 'referral_code')) {

            Schema::table('users', function (Blueprint $table) {
                $table->integer('referral_code')->default(0)->after('is_active');
                $table->integer('used_referral_code')->default(0)->after('referral_code');
                $table->integer('commission_amount')->default(0)->after('used_referral_code');
            });
        }
        if (Schema::hasColumn('users', 'referral_code')){
            do {
                $code = rand(100000, 999999);
            } while (DB::table('users')->where('referral_code', $code)->exists());
            DB::table('users')->where('type','owner')->update(['referral_code' => $code]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
};
