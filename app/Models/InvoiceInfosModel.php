<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use DB;

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

    public static function generateInvoiceSlNo($sccBatch) {
        return $sccBatch.rand(99999,10000).time();
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
            'paidAmnt',
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
            'u.id as userID',
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
    public static function receivedAmntInfo($where) {
        $query    =    InvoiceInfosModel:: where(['isActive'=>1])
        ->join('registrationrecord as applicant', function($join) {
            $join->on('applicant.id', '=', 'invoice_infos.applicantId')->where(["applicant.is_active"=>1]) ;
        })
            ->join('users as u', function($join) {
                $join->on('u.id', '=', 'applicant.user_id') ;
            });
        if(!empty($where)) {
            $query->where($where);
        }
        return $query->sum('store_amount');
    }
    public static function receivedCtgInfo($where) {
        $query    =    InvoiceInfosModel::selectRaw("applyType,Count(applicant.id) as applyParticipator, SUM(store_amount) AS
        paymentGetwayRecivedAmnt,". "COUNT(CASE WHEN approved_status =3 THEN applicant.id ELSE NULL END) AS PaidParticipant," . "COUNT(CASE WHEN applicant.approved_status = 2 THEN applicant.id ELSE NULL END) AS invoiceGeneratedParticipant")-> where(['isActive'=>1])
        ->join('registrationrecord as applicant', function($join) {
            $join->on('applicant.id', '=', 'invoice_infos.applicantId')->where(["applicant.is_active"=>1]) ;
        })->join('users as u', function($join) {
                $join->on('u.id', '=', 'applicant.user_id') ;
            });
        if(!empty($where)) {
            $query->where($where);
        }
        $query->groupBy('applicant.applyType');
        return $query->get();
    }

    public static function batchWiseReceivedAmnt($where) {
        $query    =    InvoiceInfosModel::selectRaw('sscBatch,Count(applicant.id) as applyParticipator, SUM(store_amount) AS
        paymentGetwayRecivedAmnt,'. "COUNT(CASE WHEN approved_status =3 THEN applicant.id ELSE NULL END) AS PaidParticipant," . "COUNT(CASE WHEN applicant.approved_status = 2 THEN applicant.id ELSE NULL END) AS invoiceGeneratedParticipant")-> where(['isActive'=>1])
            ->join('registrationrecord as applicant', function($join) {
                $join->on('applicant.id', '=', 'invoice_infos.applicantId')->where(["applicant.is_active"=>1]) ;
            })->join('users as u', function($join) {
                $join->on('u.id', '=', 'applicant.user_id') ;
            });
        if(!empty($where)) {
            $query->where($where);
        }
        $query->groupBy('applicant.sscBatch');
        return $query->get();
    }
    public static function bestBatchWiseReceivedAmnt($where) {
        $query    =    InvoiceInfosModel::selectRaw('sscBatch,Count(applicant.id) as applyParticipator, SUM(store_amount) AS
        paymentGetwayRecivedAmnt,'. "COUNT(CASE WHEN approved_status =3 THEN applicant.id ELSE NULL END) AS PaidParticipant," . "COUNT(CASE WHEN applicant.approved_status = 2 THEN applicant.id ELSE NULL END) AS invoiceGeneratedParticipant")-> where(['isActive'=>1])
            ->join('registrationrecord as applicant', function($join) {
                $join->on('applicant.id', '=', 'invoice_infos.applicantId')->where(["applicant.is_active"=>1]) ;
            })->join('users as u', function($join) {
                $join->on('u.id', '=', 'applicant.user_id') ;
            });
        if(!empty($where)) {
            $query->where($where);
        }
        $query->orderBy('paymentGetwayRecivedAmnt',"DESC");
        $query->groupBy('applicant.sscBatch');
        return $query->get();
    }
    public static function dateReceivedAmnt($where) {
        $query    =    InvoiceInfosModel::select(DB::raw('DATE_FORMAT(tran_date, "%d %b, %Y") as receivedDate'))
            ->selectRaw('SUM(store_amount) AS paymentGetwayRvdAmnt,Count(applicant.id) as applyParticipator')-> where(['isActive'=>1])
            ->join('registrationrecord as applicant', function($join) {
                $join->on('applicant.id', '=', 'invoice_infos.applicantId')->where(["applicant.is_active"=>1]) ;
            })->join('users as u', function($join) {
                $join->on('u.id', '=', 'applicant.user_id') ;
            });
        if(!empty($where)) {
            $query->where($where);
        }
        $query->groupBy(DB::raw('DATE(tran_date)'))->orderBy('tran_date','ASC')->having('paymentGetwayRvdAmnt','>',0)
            ->get();
        return $query->get();

    }





}
