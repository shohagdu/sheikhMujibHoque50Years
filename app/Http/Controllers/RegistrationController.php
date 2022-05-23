<?php

namespace App\Http\Controllers;

use App\Models\ExpenseCtgModel;
use App\Models\SmsHistory;
use Illuminate\Http\Request;
use App\Models\RegistrationModels;
use App\Models\RegRateChartModel;
use App\Models\InvoiceInfosModel;
use App\Models\RegGuestInfosModel;
use Auth;
use Illuminate\Support\Facades\Validator;
use Toastr;
use DB;

class RegistrationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function confirmRegistration($registerID)
    {
        $applicantInfo      = RegistrationModels::where(['user_id'=>$registerID])->first();
        $profession         = ExpenseCtgModel::where(['is_active'=>1,'type'=>2])->pluck('title','id');
        $applicantApplyType = RegRateChartModel::select(DB::raw('CONCAT(title," (",amount," BDT)") AS title'),'id')->where(['is_active'=>1,'type'=>1])->pluck ('title','id');
        $gustApplyType      = RegRateChartModel::select(DB::raw('CONCAT(title," (",amount," BDT)") AS title'),'id')
            ->where(['is_active'=>1,'type'=>2])->pluck ('title','id');
        $userType           = (!empty(Auth::user()->user_type)?Auth::user()->user_type:'');
        $userInfo           = Auth::user();
        $data = [
            'page_title'        => 'Confirm Registration',
            'applicantInfo'     => $applicantInfo,
            'profession'        => $profession,
            'userType'          => $userType,
            'userInfo'          => $userInfo,
            'applicantApplyType'=> $applicantApplyType,
            'gustApplyType'     => $gustApplyType,
        ];

        return view('admin.registerApplicant.confirmRegistration',compact('data'));
    }

    public function store(Request $request)
    {
       // dd($request->all());
        $applicantInfo      = RegistrationModels::where(['id'=>$request->appID])->first();
        $userType=(!empty(Auth::user()->user_type)?Auth::user()->user_type:'');

        $validator = Validator::make($request->all(), [
            'applyType'              => ['required'],
            'gender'              => ['required'],

        ],[
            'applyType.required'                 => 'সদস্য ধরন চিহ্নিত করুন',
            'gender.required'                   => 'লিংঙ্গ চিহ্নিত করুন',
            'currentProfession.required'        => 'The Current Profession is required',
        ]);
        $error_array=array();
        if ($validator->fails()) {
            foreach ($validator->messages()->getMessages() as $field_name => $messages) {
                $error_array[] = $messages;
            }

            $response = ['error'=> $error_array];
            return response()->json($response);
        }


        $destinationImagePath = 'uploads/registeredApplicant';
        $extensionArray = ['jpg', 'jpeg', 'png',  'PNG', 'JPG', 'JPEG', ];

        if (!empty($request->file('picture'))) {
            $image = $request->file('picture');
            $extension = $image->getClientOriginalExtension();

            $picture = $image->getSize();
            $pictureMB = number_format($picture / 1048576, 2);
            if ($pictureMB > 15) {
                $error_array[] = 'File Attachment Maximum size 15 MB ';
                $response = ['error'=> $error_array];
                return response()->json($response);
            }
            if (!in_array($extension, $extensionArray)) {
                $error_array[] = 'File Extension  should be jpg, jpeg  or png ';
                $response = ['error'=> $error_array];
                return response()->json($response);
            }
            if ($pictureMB <= 5 && in_array($extension, $extensionArray)) {
                $file_name = "profile_" .time() .'.' . $extension;
                $image->getClientOriginalName();
                $image->move($destinationImagePath, $file_name);
                $picture = $destinationImagePath . '/' . $file_name;
            } else {
                $picture = '';
            }
        } elseif (!empty($request->imageOld)) {
            $picture = $request->imageOld;
        } else {
            $picture = '';
        }

        if(empty($request->update_id)) {
            DB::beginTransaction();
            try {
                $membershipId = RegistrationModels::generateApplicantSlNo($applicantInfo->sscBatch);

                $dataArray = [
                    'membershipId'          => $membershipId,
                    'applyType'             => $request->applyType,
                    'isFather'              => $request->isFatherHusband,
                    'fatherHusbandName'     => $request->fatherHusbandName,
                    'address'               => $request->present_address,
                    'gender'                => $request->gender,
                    'occupation'            => $request->currentProfession,
                    'workPlace'             => $request->currentProfessionDetails,
                    'tShirtSize'            => $request->tShirtSize,
                    'picture'               => $picture,
                    'approved_status'       => 2,
                    'class_name'            => $request->className,
                    'roll_no'               =>$request->rollNo,
                    'is_active'             => 1,
                    'created_at'            => date('Y-m-d H:i:s'),
                    'created_by'            => Auth::id(),
                    'created_ip'            => $request->ip(),
                    'updated_at'            => date('Y-m-d H:i:s'),
                    'updated_by'            => Auth::id(),
                    'updated_ip'            => $request->ip()
                ];
                //dd($dataArray);

                $invInfo=[
                    'invoiceId'           => InvoiceInfosModel ::generateInvoiceSlNo(),
                    'transId'             => $applicantInfo->sscBatch.rand(999999999,100000000),
                    'applicantId'         => $applicantInfo->id,
                    'applicantRegCrg'     => $request->applicantRegAmnt,
                    'guestRegCrg'         => $request->guestRegTotalAmnt,
                    'totalRegCrg'         => $request->applicantGuestAmnt,
                    'transactionPer'      => '2.50',
                    'transactionFeesAmnt' => $request->onlineTransFeeAmnt,
                    'netAmount'           => $request->netFeeAmnt,
                    'paidAmnt'            => '0.00' ,
                    'created_at'          => date('Y-m-d H:i:s'),
                    'created_by'          => Auth::id(),
                    'created_ip'          => $request->ip(),
                    'updated_at'          => date('Y-m-d H:i:s'),
                    'updated_by'          => Auth::id(),
                    'updated_ip'          => $request->ip()
                ];
                if(!empty($request->guestApplyType)){
                    $gustInfo=[];
                    foreach ($request->guestApplyType as $guestKey=>$guest){
                        $gustInfo[]=[
                            'applicantId'           => $applicantInfo->id,
                            'ctg_id'                => $guest,
                            'name'                  => $request->guestName[$guestKey],
                            'mobile'                => $request->guestMobile[$guestKey],
                            'amount'                => $request->guestTaka[$guestKey],
                            'created_at'            => date('Y-m-d H:i:s'),
                            'created_by'            => Auth::id(),
                            'created_ip'            => $request->ip(),
                            'updated_at'            => date('Y-m-d H:i:s'),
                            'updated_by'            => Auth::id(),
                            'updated_ip'            => $request->ip()
                        ];

                    }
                }

                //  dd($gustInfo);
                RegistrationModels::where('id',$applicantInfo->id)->update($dataArray);
             //   dd($invInfo);
                $invoiceId = DB::table('invoice_infos')->insertGetId($invInfo);
//                $invoiceInfo= InvoiceInfosModel ::create($invInfo);
//                $invoiceId = $invoiceInfo->id;
                if(!empty($gustInfo)) {
                    RegGuestInfosModel::insert($gustInfo);
                }

                DB::commit();
                $redirectTo = '/waitingForPayment/'.$invoiceId;

                $response = [
                    'success' => "Your Information Successfully Update",
                    'redirectTo' => $redirectTo
                ];
                \Toastr::success($response['success']);
                return response()->json($response);
            } catch (\Exception $e) {
                DB::rollback();
                $error_array[] =$e->getMessage();
                $response = ['error' =>$error_array ];
                return response()->json($response);
            }

        }else{


        }
    }
    public function waitingForPayment($invoiceID)
    {
        $invoiceRecord      = [];
        $guestInfo          = [];
        $InvoiceInfo      = InvoiceInfosModel::select(
            'invoice_infos.id as invoiceIDs',
            'applicantId',
            'applicantRegCrg',
            'guestRegCrg',
            'totalRegCrg',
            'transactionPer',
            'transactionFeesAmnt',
            'netAmount',
            'paidStatus',
            'applyType',
            'name',
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
        )
            ->leftJoin('registrationrecord as applicant', function($join) {
                $join->on('applicant.id', '=', 'invoice_infos.applicantId')->where(["applicant.is_active"=>1]) ;
            })
            ->leftJoin('reg_rate_chart as gustCtg', function($join) {
                $join->on('gustCtg.id', '=', 'applicant.applyType')->where(["gustCtg.is_active"=>1]) ;
            })
            ->leftJoin('all_settings as occupationInfo', function($join) {
                $join->on('occupationInfo.id', '=', 'applicant.occupation')->where(["occupationInfo.is_active"=>1]) ;
            })

            ->where(['invoice_infos.id'=>$invoiceID,'isActive'=>1]);
        if($InvoiceInfo->count()>0){
            $invoiceRecord=$InvoiceInfo->first();
        }
        if(!empty($invoiceRecord->applicantId)) {
            $guestInfo =
                RegGuestInfosModel::select('reg_gust_infos.id','reg_gust_infos.ctg_id','reg_gust_infos.name','reg_gust_infos.mobile','reg_gust_infos.amount',"gustCtg.title as gustCtgTitle")
                ->leftJoin('reg_rate_chart as gustCtg', function($join) {
                    $join->on('gustCtg.id', '=', 'reg_gust_infos.ctg_id')->where(["gustCtg.is_active"=>1]) ;
                })
                ->where(['reg_gust_infos.applicantId'=>$invoiceRecord->applicantId,'reg_gust_infos.isActive'=>1]);
            if($guestInfo->count()>0) {
               $guestInfo   = $guestInfo->get();
            }
        }
        $userInfo           = Auth::user();
        $data = [
            'page_title'        => 'Confirm Payment',
            'applicantInfo'     => $invoiceRecord,
            'guestInfo'         => $guestInfo,
            'userInfo'          => $userInfo,
        ];

        return view('admin.registerApplicant.waitingForPayment',compact('data'));
    }


}
