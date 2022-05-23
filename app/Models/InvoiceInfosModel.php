<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class InvoiceInfosModel extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $table = 'invoice_infos';

    protected $fillable = [
        'invoiceId',
        'transId',
        'applicantId',
        'isActive',
        'created_ip',
    ];

    public static function generateInvoiceSlNo() {
        return rand(99999,10000).time();
    }



}
