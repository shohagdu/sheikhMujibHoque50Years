<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class RegGuestInfosModel extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $table = 'reg_gust_infos';

    protected $fillable = [
        'applicantId',
        'ctg_id',
        'isActive',
        'created_ip',
    ];
}
