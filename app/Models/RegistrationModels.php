<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class RegistrationModels extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $table = 'registrationrecord';

    protected $fillable = [
        'user_id',
        'name',
        'sscBatch',
        'created_ip',
    ];

    public static function generateApplicantSlNo($batch) {
        return $batch.rand(99999,10000);
    }



}
