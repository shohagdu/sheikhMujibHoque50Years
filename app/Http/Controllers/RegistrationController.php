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
use Intervention\Image\ImageManagerStatic as Image;
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
            'applyType'                     => 'required',
            'gender'                        => 'required',
            'fatherHusbandName'             => 'required',
            'class_name'                    => '[required_if:applyType,2]',
            'roll_no'                       => '[required_if:applyType,2]',

          //  'occupation'                    => 'required_if:applyType,1',
          //  'workPlace'                     => 'required_if:applyType,1',




        ],[
            'applyType.required'                => 'সদস্য ধরন চিহ্নিত করুন',
            'gender.required'                   => 'লিংঙ্গ চিহ্নিত করুন',
            'fatherHusbandName.required'        => 'পিতা/স্বামীর নাম প্রদান করুন',
            'class_name.required_if'            => 'শ্রেণী চিহ্নিত করুন',
            'roll_no.required_if'               => 'রোল নং প্রদান করুন',

            'occupation.required_if'            => 'পেশা চিহ্নিত করুন',
            'workPlace.required_if'             => 'কর্মস্থল এর তথ্য প্রদান করুন ',
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
                $image = Image::make($destinationImagePath . "/" . $file_name);
                $x = $image->width();
                $y = $image->height();
                if ($x > 300 || $y > 300) {
                    if ($x > $y) {
                        $image->resize(300, ($y / $x) * 300);
                    } else {
                        $image->resize(($x / $y) * 300, 300);
                    }
                }
                $image->save($destinationImagePath . "/" . $file_name);
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
                // Invoice
                $invoiceId = DB::table('invoice_infos')->insertGetId($invInfo);
                if($request->netFeeAmnt<=0 && $request->applyType==2 ) {
                    $dataArray['approved_status'] = 3;
                    $dataArray['hasFamilyMember'] = 1;
                    $dataArray['paidInvoiceId'] = $invoiceId;
                }elseif($request->netFeeAmnt > 0 && $request->applyType==2 ) {
                    $dataArray['approved_status'] = 2;
                    $dataArray['hasFamilyMember'] = 2;
                }else{
                    $dataArray['approved_status'] = 2;
                }
                // Applicant
                RegistrationModels::where('id',$applicantInfo->id)->update($dataArray);

                // Guest Information
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

        $guestInfo          = [];
        $invoiceRecord      = InvoiceInfosModel::InvoiceWithAppInfo(['invoice_infos.id'=>$invoiceID,'invoice_infos.isActive'=>1]);
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
