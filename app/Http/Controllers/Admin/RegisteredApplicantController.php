<?php
namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\RegRateChartModel;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\InvoiceInfosModel;
use App\Models\RegistrationModels;
use App\Models\DonarInfo;
use App\Models\SmsHistory;
use Auth;
use Toastr;
use DB;



class RegisteredApplicantController extends Controller
{
    private $createdAt;
    private $userID;
    private $ipAddress;

    public function __construct()
    {
        $this->createdAt    = date('Y-m-d H:i:s');
        $this->ipAddress    = \request()->ip();
        $this->userID       = $this->middleware(function ($request, $next) {
            $this->userID   = Auth::user()->id;
            return $next($request);
        });
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
      //  dd('hello the world');
        if ($request->ajax()) {
            $userType = (!empty(Auth::user()->user_type) ? Auth::user()->user_type : '');
            $searchText = !empty($request->search['value']) ? $request->search['value'] : false;
            $query = RegistrationModels::where([
                [
                    'registrationrecord.is_active',
                    '=',
                    '1'
                ]

            ])->
            select('invoice_infos.*', 'registrationrecord.name','registrationrecord.sscBatch','registrationrecord.tShirtSize','registrationrecord.picture','registrationrecord.class_name','registrationrecord.class_name','registrationrecord.roll_no', "u.name as userName","u.email as mobileNumber","u.mobile as emailAddress","registrationrecord.applyType","registrationrecord.isApprovedAuthority","registrationrecord.approved_status","registrationrecord.id as applicnatPrimaryID");
            $query->join('invoice_infos', function($join) {
                $join->on('registrationrecord.paidInvoiceId', '=', 'invoice_infos.id')->where(["invoice_infos.isActive"=>1]) ;
            })
                ->join('users as u', function($join) {
                    $join->on('u.id', '=', 'registrationrecord.user_id') ;
                });

            if (!empty($request->sscBatch)) {
                $query->where('registrationrecord.sscBatch', '=', $request->sscBatch);
            }
            if (!empty($request->paymentStatus)) {
                if( $request->paymentStatus==2){ //Pending for approved (std)
                    $query->where(['approved_status'=>2,'isApprovedAuthority'=>1,'applyType'=>2]);
                }elseif($request->paymentStatus==10){ //Approved (std)
                    $query->where(['approved_status'=>2,'isApprovedAuthority'=>2,'applyType'=>2]);
                }elseif($request->paymentStatus==11){ // Paid
                    $query->where(['approved_status'=>3,'isApprovedAuthority'=>1,'paidStatus'=>2]);
                    $query->whereIn('applyType',[1,3]);
                }elseif($request->paymentStatus==11){ // Inv. Generated
                    $query->where(['approved_status'=>3,'isApprovedAuthority'=>1,'paidStatus'=>1]);
                    $query->whereIn('applyType',[1,3]);
                }elseif($request->paymentStatus==6){ // cancelled
                    $query->where(['approved_status'=>6,'isApprovedAuthority'=>1,'paidStatus'=>1]);
                }elseif($request->paymentStatus==4){ // Declined
                    $query->where(['approved_status'=>4,'isApprovedAuthority'=>1,'paidStatus'=>1]);
                }

            }else{
                $query->whereIn('approved_status',[1,2,3]);
            }
            if (!empty($request->applyCtg)) {
                $query->where('applyType', $request->applyCtg);
            }
            if (!empty($request->className)) {
                $query->where('class_name', $request->className);
            }
            if (!empty($request->gender)) {
                $query->where('gender', $request->gender);
            }



//
            $total = $query->count();
            $totalFiltered = $total;

            $result = $query->skip($request->start)->take($request->length)
                ->when(($searchText), function ($query) use ($searchText) {
                    $query->where(function ($q) use ($searchText) {
                        $q->orWhere('registrationrecord.name', 'like', '%' . $searchText . '%');
                        $q->orWhere('registrationrecord.sscBatch', 'like', '%' . $searchText . '%');
                    });
                })
                ->orderBy('id', 'DESC')
                ->groupBy('invoice_infos.applicantId')
                ->get();
            //dd($result);

            $data = [];
            if (count($result) > 0) {
                $sl = $request->start + 1;
                $classInfo= RegistrationModels::classInfo();
                foreach ($result as $key => $row) {
                    $btn = '';

                    if ( $row->applyType==2) {

                        if ( (!in_array($row->approved_status,[1,2,3]) || $row->isApprovedAuthority == 1) ) {
                            $btn .= ' <button type="button" class="btn btn-info btn-sm " data-toggle="modal" data-target="#donationModal" data-toggle="tooltip" title="View Donation Modal" onclick="updateRegistredAppInfo(' . $row->applicnatPrimaryID . ')" id="editUserBasicInfo_' . $row->applicnatPrimaryID . '" ><i class="glyphicon glyphicon-pencil"></i><i class="fa fa-plus"></i> Approved </button>';
                        }

                        if (($userType == 1 || $userType == 2) && (in_array($row->approved_status,[1,2,3])) ) {
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Delete"  data-id="' . $row->applicnatPrimaryID
                                . '" data-original-title="Delete" class="btn btn-danger btn-sm deleteData"><i class="fa fa-times"></i> Decline </a>';
                        }
                    }


                    //$btn .= ' <button type="button" class="btn btn-info btn-sm " data-toggle="modal"
                    // data-target="#donationModal" data-toggle="tooltip" title="View Donation Modal" onclick="updateDoantionInfo(' . $row->id . ')" id="editUserBasicInfo_' . $row->id . '" ><i class="glyphicon glyphicon-pencil"></i><i class="fa fa-times"></i> Declined </button>';
                    $classRollInfo='';
                    if(!empty($classInfo[$row->class_name])) {
                        $classRollInfo= "<br/>". $classInfo[$row->class_name] .' ('. $row->roll_no.')';
                    }
                    $data[] = [
                        'sl'                => $sl++,
                        'name'              => $row->name.$classRollInfo,
                        'mobileNumber'      => $row->mobileNumber,
                        'sscBatch'          => $row->sscBatch,
                        'gustCount'         => '',
                        'TransactionID'     => $row->transId,
                        'netAmount'         => $row->netAmount,
                        'store_amount'      => (!empty($row->store_amount)?$row->store_amount:'0.00'),
                        'created_at'         =>  date('d M, Y h:i a', strtotime($row->created_at)),
                        'paid_date'         =>  date('d M, Y h:i a', strtotime($row->paid_date)),

                        'invoiceId'         => $row->invoiceId,
                        'approvedStatus'   => RegistrationModels::getAppPaymentStatus($row->paidStatus,$row->applyType,$row->isApprovedAuthority,$row->approved_status) ,
                        'action'            => $btn,
                    ];
                }
            }

            $json_data = array(
                "draw" => intval($request->draw),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
                "recordsTotal" => intval($total),  // total number of records
                "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
                "data" => $data   // total data array
            );

            return response()->json($json_data); // send data as json format

        }
        $data = [
            'breadcrumb' => [
                [
                    'title' => 'Dashboard',
                    'url' => route('admin.dashboard'),
                    'active' => true,
                ],
                [
                    'title' => 'Account Transaction',
                    'url' => route('admin.dashboard'),
                    'active' => true,
                ],
                [
                    'title' => 'Capital Investment',
                    'url' => false,
                    'active' => false,
                ]
            ],
            'page_title' => 'Capital Investment'
        ];
        $applicantApplyType = RegRateChartModel::select(DB::raw('CONCAT(title," (",amount," BDT)") AS title'),'id')->where(['is_active'=>1,'type'=>1])->pluck ('title','id');
        $classInfo= RegistrationModels::classInfo();
        return view('admin.registered.index', compact('data', 'applicantApplyType','classInfo'));
    }

    public function destroy(request $request)
    {
        $info   =   RegistrationModels::applicantInfo(['registrationrecord.id'=>$request->id]);
        if(!empty($info) && $info->approved_status==4) {
            $response = ['error' =>'This Application has current status and next status is same.'];
            return response()->json($response);
        }
        $userType           = Auth::user()->user_type;
        if(!in_array($userType,[1,2,3])){
            $response = ['error' =>'Un-Authorized Request'];
            return response()->json($response);
        }
        DB::beginTransaction();
        try {
            $data = [
                'isApprovedAuthority'   => 1,
                'approved_status'       => 4,
                'updated_at'            => date('Y-m-d H:i:s'),
                'updated_by'            => Auth::id(),
                'updated_ip'            => $this->ipAddress
            ];


            RegistrationModels::where('id',$request->id)->update($data);
            DB::commit();
            $redirectTo = route('registered.index');
            $response = ['success'=>"Applicant  Info.  Declined Successfully.", 'redirectTo' =>
                $redirectTo];
            \Toastr::success($response['success']);
        }
        catch (\Exception $e){
            DB::rollback();
            $response = ['error'=>$e->getMessage()];
        }

        return response()->json($response);

    }
    public function singleApplicantInfo(Request $request){

        DB::beginTransaction();
        try {
            $info   =   RegistrationModels::applicantInfo(['registrationrecord.id'=>$request->id]);
            $info->approvedStatus=RegistrationModels::getAppPaymentStatus($info->paidStatus,$info->applyType,
                $info->isApprovedAuthority,
                $info->approved_status);
            DB::commit();
            $response = ['status'=>'success', 'message'=>"Data Found Successfully", 'data' => $info];
        }catch (\Exception $e){
            DB::rollback();
            $response = ['status'=>'error','message'=>$e->getMessage(),'data'=>[]];
        }
        return response()->json($response);
    }
    public function update(Request $request)
    {
       // dd($request->all());
        $this->validate($request, [
            'update_id' => 'required|numeric',
        ]);
        $currentData = RegistrationModels::applicantInfo(['registrationrecord.id'=>$request->update_id]);
       // dd($currentData->mobileNumber);
        if($currentData->isApprovedAuthority==$request->nextStatus) {
            $response = ['error' =>'This Application has current status and next status is same.'];
            return response()->json($response);
        }


        DB::beginTransaction();
        try {
            $updateInfo=[
                'updated_at'        => date('Y-m-d H:i:s'),
                'updated_by'        => Auth::id(),
                'updated_ip'        => $request->ip()
            ];
            $sms ="Dear {$currentData->name}, We, at '50 Years Celebrate of Sheikh Mujibal Hoque High School',  greatly appreciate your registration. Your application   has been successfully approved ";
            $smsHistory=[
                'donar_id'         => $request->update_id,
                'mobile_number'    => $currentData->mobileNumber,
                'msg'              => $sms,
                'send_status'      => 1,
                'ins_date'         => date('Y-m-d H:i:s'),
                'ins_by'           => Auth::id()
            ];
            $data = [
                'isApprovedAuthority'    => 2,
               // 'processInfo'       => json_encode($updateInfo),
                'updated_at'        => date('Y-m-d H:i:s'),
                'updated_by'        => Auth::id(),
                'updated_ip'     => $request->ip()
            ];

            SmsHistory::create($smsHistory);
            RegistrationModels::where('id',$request->update_id)->update($data);
            DB::commit();
            $redirectTo = route('donation.donationRecord');
            $response = ['success'=>"Successfully Approved", 'redirectTo' => $redirectTo];
            \Toastr::success($response['success']);
        } catch (\Exception $e){
            DB::rollback();
            $response = ['error'=>$e->getMessage()];
        }

        return response()->json($response);
    }
}
