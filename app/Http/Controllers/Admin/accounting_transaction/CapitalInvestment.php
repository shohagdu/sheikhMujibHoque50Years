<?php

namespace App\Http\Controllers\Admin\accounting_transaction;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\TransactionalCOA;
use App\Models\GeneralLedger;
use Auth;
use Toastr;
use DB;

class CapitalInvestment extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $searchText = !empty($request->search['value']) ? $request->search['value'] : false;

            $query = GeneralLedger::where([
                [
                    'status',
                    '=',
                    'active'
                ],
                [
                    'transaction_type',
                    '=',
                    'capital_investment'
                ],
                [
                    'transaction_parent_id',
                    '=',
                    null
                ]
            ])->
            select('*');

            $total = $query->count();
            $totalFiltered = $total;

            $result = $query->skip($request->start)->take($request->length)
                ->when(($searchText), function($query) use ($searchText) {
                    $query->where(function($q) use ($searchText){
                        $q->orWhere('transaction_id', 'like', '%'.$searchText.'%');
                    });
                })
                ->orderBy('id', 'DESC')
                ->get();


            $data = [];
            if(count($result) > 0) {
                $sl = $request->start + 1;

                foreach ($result as $key => $row) {
                    $editRoute = route('accounting_transaction.capital_investment.edit', ['id' => $row->id]);
                    $btn = '';
                    $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Details"  data-id="' . $row->id . '" data-original-title="Transaction Details" class="btn btn-success btn-sm viewStockDetail"><i class="fa fa-eye"></i></a>';
                    $btn .= ' <a href="'.$editRoute.'" data-toggle="tooltip" title="Edit"  data-id="' . $row->id . '" data-original-title="Edit" class="btn bg-purple btn-sm  editData"><i class="fa fa-edit"></i></a>';
                    $btn .= ' <a href="javascript:void(0)" data-toggle="tooltip" title="Delete"  data-id="' . $row->id . '" data-original-title="Delete" class="btn btn-danger btn-sm deleteData"><i class="fa fa-trash"></i></a>';

                    $data[] = [
                        'sl' => $sl++,
                        'transaction_id' => $row->transaction_id,
                        'amount' => $row->amount,
                        'comment' => $row->comment,
                        'created_at' => date('d M, Y h:i:A'),
                        'action' => $btn,
                    ];
                }
            }

            $json_data = array(
                "draw" => intval($request->draw),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw.
                "recordsTotal" => intval($total),  // total number of records
                "recordsFiltered" => intval($totalFiltered), // total number of records after searching, if there is no searching then totalFiltered = totalData
                "data" => $data   // total data array
            );

            return  response()->json($json_data); // send data as json format

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
            'page_title'=> 'Capital Investment'
        ];
        return view('admin.accounting_transaction.capital_investment.index',compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
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
                    'url' => route('accounting_transaction.capital_investment'),
                    'active' => true,
                ],
                [
                    'title' => 'Add',
                    'url' => false,
                    'active' => false,
                ]
            ],
            'page_title'=> 'Add Capital Investment',
            'receiveing_accounts' => TransactionalCOA::getAllTransactionalCurrentAsset()
        ];
        return view('admin.accounting_transaction.capital_investment.create',compact('data'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'invest_amount' => 'required|numeric',
            'comment' => 'required',
            'receiving_account' => 'required|integer'
        ]);

        DB::beginTransaction();

        try {
            $transactionId = GeneralLedger::getTransactionId();
            $data_arr = [
                'transaction_id' => $transactionId,
                'amount' => $request->invest_amount,
                'comment' => $request->comment,
                'transaction_type' => GeneralLedger::$CAPITALINVESTMENT,
                'created_at' => date('Y-m-d H:i:s'),
                'created_by' => Auth::id(),
                'created_by_ip' => $request->ip(),
                'updated_at' => date('Y-m-d H:i:s'),
                'updated_by' => Auth::id(),
                'updated_by_ip' => $request->ip(),

            ];

            GeneralLedger::insert($data_arr);

            $primaryId = DB::getPdo()->lastInsertId();

            $transactionDetails = [
                [
                    'transaction_parent_id' => $primaryId,
                    'debit_id' => $request->receiving_account,
                    'credit_id' => null,
                    'amount' => $request->invest_amount,
                    'transaction_type' => GeneralLedger::$CAPITALINVESTMENT,
                    'created_at' => date('Y-m-d H:i:s'),
                    'created_by' => Auth::id(),
                    'created_by_ip' => $request->ip(),
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => Auth::id(),
                    'updated_by_ip' => $request->ip()
                ],
                [
                    'transaction_parent_id' => $primaryId,
                    'credit_id' => TransactionalCOA::getOwnerInvestmentTransactionCOA()->id,
                    'debit_id' => null,
                    'amount' => $request->invest_amount,
                    'transaction_type' => GeneralLedger::$CAPITALINVESTMENT,
                    'created_at' => date('Y-m-d H:i:s'),
                    'created_by' => Auth::id(),
                    'created_by_ip' => $request->ip(),
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => Auth::id(),
                    'updated_by_ip' => $request->ip()
                ]
            ];
            GeneralLedger::insert($transactionDetails);

            DB::commit();
            $redirectTo = route('accounting_transaction.capital_investment');
            $response = ['success'=>"Transaction Saved Successful.", 'redirectTo' => $redirectTo];
            \Toastr::success($response['success']);
        }
        catch (\Exception $e){
            DB::rollback();
            $response = ['error'=>$e->getMessage()];
        }

        return response()->json($response);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $debitDetails = GeneralLedger::select('*')->where(
            [
                [
                    'transaction_parent_id',
                    '=',
                    $id
                ],
                [
                    'debit_id',
                    '>',
                    0
                ]
            ]
        )->first($id);
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
                    'url' => route('accounting_transaction.capital_investment'),
                    'active' => true,
                ],
                [
                    'title' => 'Add',
                    'url' => false,
                    'active' => false,
                ]
            ],
            'page_title'=> 'Edit Capital Investment',
            'receiveing_accounts' => TransactionalCOA::getAllTransactionalCurrentAsset(),
            'transaction_info' => GeneralLedger::find($id),
            'transaction_details' => GeneralLedger::getTransactionDetails($id),
            'debit_details' => $debitDetails,
        ];
        return view('admin.accounting_transaction.capital_investment.edit',compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'invest_amount' => 'required|numeric',
            'comment' => 'required',
            'id' => 'required',
            'receiving_account' => 'required|integer'
        ]);

        DB::beginTransaction();


        try {
            $currentTransaction = GeneralLedger::find($id);
            GeneralLedger::deleteTransaction($id);
            $transactionId = GeneralLedger::getTransactionId();

            $data_arr = [
                'transaction_id' => $transactionId,
                'amount' => $request->invest_amount,
                'comment' => $request->comment,
                'transaction_type' => GeneralLedger::$CAPITALINVESTMENT,
                'created_at' => $currentTransaction->created_at,
                'created_by' => $currentTransaction->created_by,
                'created_by_ip' => $currentTransaction->created_by_ip,
                'updated_at' => date('Y-m-d H:i:s'),
                'updated_by' => Auth::id(),
                'updated_by_ip' => $request->ip(),

            ];

            GeneralLedger::insert($data_arr);

            $primaryId = DB::getPdo()->lastInsertId();

            $transactionDetails = [
                [
                    'transaction_parent_id' => $primaryId,
                    'debit_id' => $request->receiving_account,
                    'credit_id' => null,
                    'amount' => $request->invest_amount,
                    'transaction_type' => GeneralLedger::$CAPITALINVESTMENT,
                    'created_at' => $currentTransaction->created_at,
                    'created_by' => $currentTransaction->created_by,
                    'created_by_ip' => $currentTransaction->created_by_ip,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => Auth::id(),
                    'updated_by_ip' => $request->ip()
                ],
                [
                    'transaction_parent_id' => $primaryId,
                    'credit_id' => TransactionalCOA::getOwnerInvestmentTransactionCOA()->id,
                    'debit_id' => null,
                    'amount' => $request->invest_amount,
                    'transaction_type' => GeneralLedger::$CAPITALINVESTMENT,
                    'created_at' => $currentTransaction->created_at,
                    'created_by' => $currentTransaction->created_by,
                    'created_by_ip' => $currentTransaction->created_by_ip,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => Auth::id(),
                    'updated_by_ip' => $request->ip()
                ]
            ];
            GeneralLedger::insert($transactionDetails);

            DB::commit();
            $redirectTo = route('accounting_transaction.capital_investment');
            $response = ['success'=>"Transaction Saved Successful.", 'redirectTo' => $redirectTo];
            \Toastr::success($response['success']);
        }
        catch (\Exception $e){
            DB::rollback();
            $response = ['error'=>$e->getMessage()];
        }

        return response()->json($response);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        try {
            GeneralLedger::deleteTransaction($id);
            DB::commit();
            $redirectTo = route('accounting_transaction.capital_investment');
            $response = ['success'=>"Transaction Deleted Successful.", 'redirectTo' => $redirectTo];
            \Toastr::success($response['success']);
        }
        catch (\Exception $e){
            DB::rollback();
            $response = ['error'=>$e->getMessage()];
        }

        return response()->json($response);

    }
}
