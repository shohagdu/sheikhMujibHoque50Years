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
    public static function InvoiceWithAppInfo($where) {
        $InvoiceInfo=InvoiceInfosModel::select(
            'invoice_infos.id as invoiceIDs',
            'invoiceId',
            'transId',
            'applicantId',
            'applicantRegCrg',
            'guestRegCrg',
            'totalRegCrg',
            'transactionPer',
            'transactionFeesAmnt',
            'netAmount',
            'paidStatus',
            'applyType',
            'applicant.isApprovedAuthority',
            'applicant.name',
            'isFather',
            'fatherHusbandName',
            'tShirtSize',
            'sscBatch',
            'address',
            'occupation',
            'workPlace',
            'membershipId',
            'class_name',
            'roll_no',
            'gender',
            'picture',
            'gustCtg.title as applyTypeCtg',
            'gustCtg.amount as applyTypeAmount',
            'occupationInfo.title as occupationTitle',
            'u.email as mobileNumber',
            'u.mobile as emailAddress',
        )
            ->leftJoin('registrationrecord as applicant', function($join) {
                $join->on('applicant.id', '=', 'invoice_infos.applicantId')->where(["applicant.is_active"=>1]) ;
            })
            ->join('users as u', function($join) {
                $join->on('u.id', '=', 'applicant.user_id') ;
            })

            ->leftJoin('reg_rate_chart as gustCtg', function($join) {
                $join->on('gustCtg.id', '=', 'applicant.applyType')->where(["gustCtg.is_active"=>1]) ;
            })
            ->leftJoin('all_settings as occupationInfo', function($join) {
                $join->on('occupationInfo.id', '=', 'applicant.occupation')->where(["occupationInfo.is_active"=>1]) ;
            })
            ->where($where);
        if($InvoiceInfo->count()>0){
           return $InvoiceInfo->first();
        }else{
            return false;
        }
    }




}
