<?php

namespace App\Http\Controllers;

use App\Models\ExpenseCtgModel;
use App\Models\SmsHistory;
use Illuminate\Http\Request;
use App\Models\RegistrationModels;
use App\Models\RegRateChartModel;
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


        $destinationImagePath = 'uploads/participant';
        $extensionArray = ['jpg', 'jpeg', 'png', 'pdf', 'PNG', 'JPG', 'JPEG', 'PDF'];

        if (!empty($request->file('invoice'))) {
            $image = $request->file('invoice');
            $extension = $image->getClientOriginalExtension();

            $picture = $image->getSize();
            $pictureMB = number_format($picture / 1048576, 2);
            if ($pictureMB > 15) {
                $error_array[] = 'File Attachment Maximum size 15 MB ';
                $response = ['error'=> $error_array];
                return response()->json($response);
            }
            if (!in_array($extension, $extensionArray)) {
                $error_array[] = 'File Extension  should be jpg, jpeg, png or pdf ';
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
                    'tShirtSize'            => $request->currentProfessionDetails,
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

                RegistrationModels::where('id',$request->appID)->update($dataArray);
                DB::commit();
                $redirectTo = url('waitingForPayment/');
                $response = ['success' => "Your Information Successfully Update", 'redirectTo' => $redirectTo];
                \Toastr::success($response['success']);
                return response()->json($response);
            } catch (\Exception $e) {
                DB::rollback();
                $error_array[] =$e->getMessage();
                $response = ['error' =>$error_array ];
                return response()->json($response);
            }

        }else{

            DB::beginTransaction();
            try {

                $dataArray = [
                    'batch'             => $request->sscBatch,
                    'name'              => $request->name,
                    'gender'            => $request->gender,
                    'mobile'            => $request->mobile,
                    'present_address'   => $request->present_address,
                    'profession'        => $request->currentProfession,
                    'profession_details' => $request->currentProfessionDetails,
                    'facebookLink'      => $request->FacebookLink,
                    'addBy'             => NULL,
                    'image'             => $picture,
                    'approved_status'   => 2,
                    'is_active'         => 1,
                    'updated_at'      => date('Y-m-d H:i:s'),
                    'updated_by'        => Auth::id(),
                    'updated_ip'        => $request->ip()
                ];
                //dd($dataArray);

                EventParticipantsModel::where('id',$request->update_id)->update($dataArray);

                DB::commit();
                $redirectTo = route('participantsRecord');
                $response = ['success' => "Your Information Successfully Update", 'redirectTo' =>
                    $redirectTo];
                \Toastr::success($response['success']);
                return response()->json($response);
            } catch (\Exception $e) {
                DB::rollback();
                $error_array[] =$e->getMessage();
                $response = ['error' =>$error_array ];
                return response()->json($response);
            }

        }
    }



}
