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
    public static function applicantInfo($where) {
        $applicantInfo    =   RegistrationModels::select(
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
            'paidStatus as invoicPaidStatus ',
            'applyType',
            'registrationrecord.name',
            'registrationrecord.paidInvoiceId',
            'registrationrecord.approved_status',
            'registrationrecord.isApprovedAuthority',
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
            ->leftJoin('invoice_infos', function($join) {
                $join->on('registrationrecord.id', '=', 'invoice_infos.applicantId')->where(["registrationrecord.is_active"=>1]) ;
            })
            ->join('users as u', function($join) {
                $join->on('u.id', '=', 'registrationrecord.user_id') ;
            })

            ->leftJoin('reg_rate_chart as gustCtg', function($join) {
                $join->on('gustCtg.id', '=', 'registrationrecord.applyType')->where(["gustCtg.is_active"=>1]) ;
            })
            ->leftJoin('all_settings as occupationInfo', function($join) {
                $join->on('occupationInfo.id', '=', 'registrationrecord.occupation')->where(["occupationInfo.is_active"=>1]) ;
            })
            ->where($where);
        if($applicantInfo->count()>0){
            return $applicantInfo->first();
        }else{
            return false;
        }
    }





}
