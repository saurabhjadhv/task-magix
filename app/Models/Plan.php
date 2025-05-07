<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class Plan extends Model
{
    protected $fillable = [
        'name',
        'storage_limit',
        'monthly_price',
        'annual_price',
        'status',
        'enable_chatgpt',
        'trial_days',
        'max_users',
        'max_projects',
        'description',
    ];

    public function arrDuration()
    {
        return [
            'Unlimited' => 'Unlimited',
            'Month' => 'Per Month',
            'Year' => 'Per Year',
        ];
    }
    public function isActive()
    {
        $id = $this->id;
        $users = User::where('type', 'owner')->where('plan', $id)->get();

        return !$users->isEmpty();
    }


}

