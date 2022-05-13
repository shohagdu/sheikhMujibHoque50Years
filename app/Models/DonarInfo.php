<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class DonarInfo extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $table = 'donarinfos';

    protected $fillable = [
        'user_id',
        'name',
        'mobileNumber',
        'sscBatch',
        'sendNumber',
        'donationBy',
        'TransactionID',
        'donationAmount',
        'TransactionMobileNumber',
        'created_by',
        'created_ip',
    ];



}
