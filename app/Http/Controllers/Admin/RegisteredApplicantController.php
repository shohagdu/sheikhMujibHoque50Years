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
        $this->createdAt = date('Y-m-d H:i:s');
        $this->ipAddress = \request()->ip();
        $this->userID = $this->middleware(function ($request, $next) {
            $this->userID = Auth::user()->id;
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
            select('invoice_infos.*', 'registrationrecord.name','registrationrecord.sscBatch','registrationrecord.tShirtSize','registrationrecord.picture','registrationrecord.class_name','registrationrecord.class_name','registrationrecord.roll_no', "u.name as userName","u.email as mobileNumber","u.mobile as emailAddress");
            $query->join('invoice_infos', function($join) {
                $join->on('registrationrecord.paidInvoiceId', '=', 'invoice_infos.id')->where(["invoice_infos.isActive"=>1,"paidStatus"=>2]) ;
            })
                ->join('users as u', function($join) {
                    $join->on('u.id', '=', 'registrationrecord.user_id') ;
                });

            if (!empty($request->sscBatch)) {
                $query->where('registrationrecord.sscBatch', '=', $request->sscBatch);
            }
            if (!empty($request->status)) {
                $query->where('approved_status', $request->status);
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


            $data = [];
            if (count($result) > 0) {
                $sl = $request->start + 1;
                $classInfo= RegistrationModels::classInfo();
                foreach ($result as $key => $row) {
                    $btn = '';

                    if ($row->paidStatus == 2) {
                        $btn .= ' <button type="button" class="btn btn-info btn-sm " data-toggle="modal" data-target="#donationModal" data-toggle="tooltip" title="View Donation Modal" onclick="updateDoantionInfo(' . $row->id . ')" id="editUserBasicInfo_' . $row->id . '" ><i class="glyphicon glyphicon-pencil"></i><i class="fa fa-eye"></i> View </button>';

                        if ($userType == 1 || $userType == 2) {
                            $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Delete"  data-id="' . $row->id
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
                        'store_amount'      => $row->store_amount,
                        'paid_date'         =>  date('d M, Y h:i a', strtotime($row->paid_date)),
                        'invoiceId'         => $row->invoiceId,
                        'classProfession'   => $row->class_name . $row->roll_no  ,
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
}
