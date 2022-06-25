<?php

namespace App\Http\Controllers;
use App\Models\InvoiceInfosModel;
use App\Models\RegGuestInfosModel;
use App\Models\SmsHistory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

use App\Models\User;
use App\Models\DonarInfo;
use App\Models\RegistrationModels;



class HomeController extends Controller
{
//        public function __construct()
//        {
//            $this->middleware('guest');
//        }
    public function index(){
        $our_history            = [];
        $director_message       = [];
        return view('home.home', compact('our_history', 'director_message'));
    }
     public function signUp(){
        return view('auth.register');
    }


    public function donationForm(){
        $fundCoordinator    =   User:: select(DB::raw("CONCAT(mobileBankBkash,' (',name,')') AS name"),'id')->where(['user_type'=>3,'status'=>1])->pluck('name','id');
        return view('home.donationForm', compact('fundCoordinator'));
    }
    public function registrationProcess(){
        $data=[
            'title'     => 'রেজিস্ট্রেশন প্রক্রিয়া',
            'info'      => '....তথ্য খুব শ্রীঘ্রই তথ্য আপডেট করা হবে।'
        ];
        return view('home.registrationProcess', compact('data'));
    }
    public function events(){
         $data=[
             'title'     => 'ইভেন্ট সম্পর্কে বিস্তারিত পডুন',
             'info'      => 'শেখ মুজিবল হক উচ্চ বিদ্যালয় ফেনী সদর উপজেলার একটি প্রাচীনতম ও ঐতিহ্যবাহী শিক্ষা প্রতিষ্ঠান,অত্র বিদ্যালয়ের ৫০ বছর পূর্তি উপলক্ষে সুবর্ণ জয়ন্তী ও প্রাক্তন ছাত্র-ছাত্রীদের পুনর্মিলনী অনুষ্ঠান চলতি বছরের ডিসেম্বরে শেষ সপ্তাহে(সম্ভাব্য)উদযাপন হতে যাচ্ছে।সুবর্ণ জয়ন্তী উদযাপন ও প্রাক্তন ছাত্র ছাত্রীদের পূর্ণমিলনী অনুষ্ঠান উপলক্ষে ম্যানুয়ালি ও অনলাইনে রেজিস্ট্রেশন কার্যক্রম চলমান আছে। অত্র বিদ্যালয়ের প্রাক্তন ছাত্র-ছাত্রীদেরকে নির্ধারিত সময়ের মধ্যে রেজিস্ট্রেশন করার জন্য সবিনয় অনুরোধ জানাচ্ছি। '
         ];
         return view('home.events', compact('data'));
    }
    public function subCommittee(){
         $data=[
             'title'     => 'উপকমিটি সমূহ',
             'info'      => '....তথ্য খুব শ্রীঘ্রই তথ্য আপডেট করা হবে।'
         ];
         return view('home.subCommittee', compact('data'));
    }
    public function contactUs(){
         $data=[
             'title'     => 'হেল্প ডেস্ক',
             'info'      => "<h4>৫০ বছর পূর্তি উদযাপন ২০২২</h4>
                    <h5>শেখ মুজিবল হক উচ্চ বিদ্যালয়</h5>
                    <h6>মজুমদারহাট, পো: ধর্মপুর, ফেনী সদর, ফেনী। </h6>
                    <p ><i class=\"fas fa-phone\"></i>&nbsp; <a href=\"tel:01819 603239\">01819 603239</a></p>"
         ];
         return view('home.contactUs', compact('data'));
    }




    public function donationProcess(){
        $fundCoordinator    =   User:: select(DB::raw("CONCAT(mobileBankBkash,' (',name,')') AS name"),'id')->where(['user_type'=>3,'status'=>1])->select('name','id','mobileBankBkash')->get();
        return view('home.donationProcess', compact('fundCoordinator'));
    }


    public function donationFormAction(request $request){
        $validator = Validator::make($request->all(), [
            'name'              => ['required', 'string', 'max:255'],
            'mobileNumber'      => ['required',   'min:11'  ,'numeric'],
            'sscBatch'          => ['required'],
            'sendNumber'        => ['required'],
            //'donationBy'        => ['required'],
//            'TransactionID' => ['required', 'string'],
            'donationAmount'    => ['required','numeric'],
            'TransactionMobileNumber'=> ['required',  'min:11'  ,'numeric'],
        ],[
            'name.required'                         => 'আপনার নাম প্রদান করুন',
            'mobileNumber.required'                 => 'আপনার মোবাইল নাম্বার প্রদান করুন',
            'sscBatch.required'                     => 'আপনার এস.এস.সি ব্যাচ চিহ্নিত করুন',
            'donationAmount.required'               => 'আপনার ডোনেশানের পরিমান প্রদান করুন',
            'sendNumber.required'                   => 'যে বিকাশ নাম্বারে টাকা পাঠাবেন চিহ্নিত',
            'TransactionMobileNumber.required'      => 'যে বিকাশ নাম্বার থেকে টাকা পাঠানো হয়েছে প্রদান করুন'
        ]);

        if ($validator->fails()) {
            return redirect('/')
                ->withErrors($validator)
                ->withInput();
        }

        $data=[
            'name'                  => $request->name,
            'mobileNumber'          => $request->mobileNumber,
            'sscBatch'              => $request->sscBatch,
            'sendNumber'            => $request->sendNumber,
            'donationBy'            => $request->donationBy,
            'TransactionID'         => $request->TransactionID,
            'donationAmount'        => $request->donationAmount,
            'TransactionMobileNumber'=> $request->TransactionMobileNumber,
            'created_at'            => date('Y-m-d H:i:s'),
            'created_by'            => NULL,
            'created_ip'            => $request->ip(),
        ];

        $userInfo=[
            'name'                  => $data['name'],
            'email'                 => $data['mobileNumber'],
            'mobile'                => $data['mobileNumber'],
            'password'              => Hash::make(123456),
            'user_type'             => 5,
            'created_at'            => date('Y-m-d H:i:s'),
            'created_by'            => NULL,
            'created_ip'            => $request->ip(),
        ];

        DB::beginTransaction();
        try {
            $userInfo           =   User::create($userInfo);
            $data['user_id']    =   $userInfo->id;
            DonarInfo::create($data);
            DB::commit();
            $success_output ="Dear {$data['name']}, Thank you for your great generosity! We, at 'Ex. Student Forum of Lemua High School',  greatly appreciate your donation. Your support helps to succeed our mission. ";
            Session::flash('message', $success_output);
            return redirect('/');
        } catch (\Exception $e) {
            DB::rollback();
            $error = $e->getMessage();
            Session::flash('message', $error);
            return redirect('/');
        }
    }
    public function sendSms(){

        $getSms=SmsHistory::select('id','mobile_number','msg')->where(['send_status'=>1])->orderBy('id','ASC')->limit(10)->get();
        if(!empty($getSms[0])){
            $sendSmsLog=[];
            foreach ($getSms as $key=>$row){
                if(!empty($row->mobile_number)) {
                    $encodebangla   = utf8_encode($row->msg );
                    $sms            = utf8_decode($encodebangla);

                    $sendSmsLog[$key]['status']='';
                    $sendSmsLog[$key] = [
                        'mobile_no' =>  $row->mobile_number,
                        'message'   =>  $row->msg,
                    ];
                    $url = 'https://www.24bulksmsbd.com/api/smsSendApi';
                    $data = array(
                        'customer_id' => 66,
                        'api_key' => 171574717329433701673050507,
                        'message' => $sms,
                        'mobile_no' => $row->mobile_number
                    );

                    $curl = curl_init($url);
                    curl_setopt($curl, CURLOPT_POST, true);
                    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
                    curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
                    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
                    curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
                    $output = curl_exec($curl);
                    curl_close($curl);
                  //  dd($output);
                    $response=(!empty($output)?json_decode($output,true):'');
                 //   dd($response);
                    if(!empty($response)) {
                        $updateInfo = [
                            'send_status' => 2,
                            'updated_at' => date('Y-m-d H:i:s'),
                        ];
                        if (!empty($response['status']) && $response['status'] == 'ok') {
                            $updateInfo['success_status'] = 1;
                            $sendSmsLog[$key]['status'] = (!empty($response['message'])?$response['message']:'').' <> Successfully Send Sms';
                        } else {
                            $updateInfo['success_status'] = 2;
                            $sendSmsLog[$key]['status']= (!empty($response['message'])?$response['message']:''). ' <> Failed to Send Sms';
                        }
                    }else{

                        $updateInfo['send_status']    = 2;
                        $updateInfo['success_status'] = 2;
                        $updateInfo['updated_at']     = date('Y-m-d H:i:s');


                        $sendSmsLog[$key]['status']         = (!empty($response['message'])?$response['message']:''). ' <> Failed to Send Sms(Response NULL)';
                    }
                    SmsHistory::where('id', $row->id)->update($updateInfo);

                }
            }

            if(!empty($sendSmsLog)){
                $si=1;
                echo "<table border='1px' rules='all' style='border: 1px solid #eee;'>";
                    echo "<tr>";
                        echo "<td>S/N</td>";
                        echo "<td>Mobile Number</td>";
                        echo "<td>Message</td>";
                        echo "<td>Status</td>";
                    echo "</tr>";
                    foreach ($sendSmsLog as $log){
                        echo "<tr>";
                            echo "<td>".$si++."</td>";
                            echo "<td>".$log['mobile_no']."</td>";
                            echo "<td>".$log['message']."</td>";
                            echo "<td>".$log['status']."</td>";
                        echo "</tr>";
                    }
                echo "</table>";
            }

        }else{
            echo "<h1 style='text-align: center;'>No SMS Pending here....</h1>";
        }
    }


    public function registrationFormAction(request $request){
        //dd($request->all());
        $validator = Validator::make($request->all(), [
            'name'              => ['required', 'string', 'max:255'],
            'mobileNo'          => ['required',   'min:11'  ,'numeric'],
            'sscBatch'          => ['required'],
            'termsCondition'          => ['required'],
            'password'          => ['required', 'string',  'confirmed'],
        ],[
            'name.required'                         => 'আপনার নাম প্রদান করুন',
            'mobileNo.required'                     => 'আপনার মোবাইল নাম্বার প্রদান করুন',
            'sscBatch.required'                     => 'আপনার এস.এস.সি ব্যাচ চিহ্নিত করুন',
            'termsCondition.required'               => 'Terms and Condition , Privacy Policy and Refund Policy. বক্সটি  চিহ্নিত করুন',
        ]);

        if ($validator->fails()) {
            return redirect('/signUp')
                ->withErrors($validator)
                ->withInput();
        }
        if(empty($request->termsCondition)){
            $error = "Terms and Condition , Privacy Policy and Refund Policy. বক্সটি  চিহ্নিত করুন" ;
            Session::flash('message', $error);
            return redirect('/signUp');
        }

        $data=[
            'name'                  => $request->name,
            'sscBatch'              => $request->sscBatch,
            'created_at'            => date('Y-m-d H:i:s'),
            'created_by'            => NULL,
            'created_ip'            => $request->ip(),
        ];

        $userInfo=[
            'name'                  => $data['name'],
            'mobile'                => $request->email,
            'email'                 => $request->mobileNo,
            'password'              => Hash::make($request->password),
            'user_type'             => 10,
            'created_at'            => date('Y-m-d H:i:s'),
            'created_by'            => NULL,
            'created_ip'            => $request->ip(),
        ];

        DB::beginTransaction();
        try {
            $userInfo           =   User::create($userInfo);
            $data['user_id']    =   $userInfo->id;
            RegistrationModels::create($data);
            DB::commit();
            $success_output = "Dear {$data['name']}, Thank you for your great generosity! We, at 'Ex. Student Forum of sheikh Mujib Hoque High School',  greatly appreciate your Registration. Your support helps to succeed our mission. ";
            Session::flash('message', $success_output);
            return redirect('/admin/dashboard');
        } catch (\Exception $e) {
            DB::rollback();
            $error = $e->getMessage();
            Session::flash('message', $error);
            return redirect('/signUp');
        }
    }

    public function paymentSuccess($transID){
        $guestInfo          = [];
        $invoiceRecord      = InvoiceInfosModel::InvoiceWithAppInfo(['invoice_infos.transId'=>$transID]);
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

            $page_title        = 'Payment Success';
            $applicantInfo     = $invoiceRecord;
            $guestInfo         = $guestInfo;


      //  return view('admin.registerApplicant.waitingForPayment',compact('data'));
        return view('home.paymentSuccess', compact(
            'page_title',
            'applicantInfo',
            'guestInfo',
        ));
    }
    public function purchaseGuide(){
        $data=[
            'title'     => 'Purchase Guide',
            'info'      => '....তথ্য খুব শ্রীঘ্রই তথ্য আপডেট করা হবে।'
        ];
        return view('home.ssl.purchaseGuide', compact('data'));
    }
    public function privacyPolicy(){
        $data=[
            'title'     => 'Privacy Policy',
            'info'      => '....তথ্য খুব শ্রীঘ্রই তথ্য আপডেট করা হবে।'
        ];
        return view('home.ssl.privacyPolicy', compact('data'));
    }
    public function termsOfService(){
        $data=[
            'title'     => 'Terms Of Service',
            'info'      => '....তথ্য খুব শ্রীঘ্রই তথ্য আপডেট করা হবে।'
        ];
        return view('home.ssl.termsOfService', compact('data'));
    }
    public function refundReturns(){
        $data=[
            'title'     => 'Refund & Returns',
            'info'      => '....তথ্য খুব শ্রীঘ্রই তথ্য আপডেট করা হবে।'
        ];
        return view('home.ssl.refundReturns', compact('data'));
    }



}
