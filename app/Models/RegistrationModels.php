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
        $tCount=RegistrationModels::select('id')->count();
        $bCount=RegistrationModels::select('id')->where(['sscBatch'=>$batch])->count();
        return $batch.str_pad($bCount+1,3,"0",STR_PAD_LEFT).str_pad($tCount+1,4,"0",STR_PAD_LEFT);
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
            'paidAmnt',
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
                $join->on('gustCtg.id', '=', 'registrationrecord.applyType') ;
            })
            ->leftJoin('all_settings as occupationInfo', function($join) {
                $join->on('occupationInfo.id', '=', 'registrationrecord.occupation') ;
            })
            ->where($where);
        if($applicantInfo->count()>0){
            return $applicantInfo->first();
        }else{
            return false;
        }
    }


    public static function classInfo(){
        return[
            6=>'????????????',
            7=>'??????',
            8=>'??????',
            9=>'??????',
            10=>'????????? (????????????)',
            11=>'????????? (??????????????????)',
        ];
    }
     public static function getAppPaymentStatus($paidStatus,$applyType,$isApprovedAuthority,$applicationStep){
        if($applicationStep==1 && $paidStatus==NULL ){
            return "Registration Complete";
        }elseif($applyType==2 && $isApprovedAuthority==1 && $applicationStep==2 ){
            return "Waiting for Approved (Student)";
        }elseif(($applyType==2)  && $isApprovedAuthority==2 ){
            return "Approved (Students)";
        }elseif(($applyType==1 || $applyType==3 )  && $paidStatus==2 ){
            return "Paid";
        }elseif(($applyType==1 || $applyType==3 )  && $paidStatus==1 ){
            return "Waiting for Payment (Inv. Generated)";
        }elseif ($applicationStep==6){
            return "Cancelled";
        }elseif ($applicationStep==4){
            return "Declined";
        }
    }


}
