@extends('admin.layouts.app')
@push('css_lib')
    <!-- DataTables -->
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}"/>
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}"/>
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}"/>
@endpush
@php
    $userType=(!empty(Auth::user()->user_type)?Auth::user()->user_type:'');
@endphp
@section('content')
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-th-list"></i> Registered Applicant Record</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-sm-2">
                                        <select name="applyCtg" id="applyCtg" class="form-control">
                                            <option value="">Select Category</option>
                                            @if(!empty($applicantApplyType))
                                                @foreach($applicantApplyType as $ctgKey =>$ctgVal )
                                                    <option value="{{ (!empty($ctgKey)?$ctgKey:'') }}">{{ (!empty($ctgVal)?$ctgVal:'') }}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <select class="form-control " id="sscBatch" name="sscBatch">
                                            <option value="">Select Batch</option>
                                            @for($i=2021;$i>=1962;$i--)
                                                <option value="{{ $i }}" {{ ((!empty(old('sscBatch')) && (old('sscBatch')==$i))?"selected":'') }}>{{ $i
                                }}</option>
                                            @endfor
                                        </select>
                                    </div>

                                    <div class="col-sm-2">
                                        <select name="status" id="status" class="form-control">
                                          <option value="3">Approved (Paid)</option>
                                          <option value="2">Waiting for Payment</option>
                                          <option value="1">Registration Complete</option>
                                          <option value="4">Declined (Not Approved)</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-2">
                                        <select name="className" id="className" class="form-control">
                                            <option value="">Select Class</option>
                                            @if(!empty($classInfo))
                                                @foreach($classInfo as $clsKey =>$clsVal )
                                                    <option value="{{ (!empty($clsKey)?$clsKey:'') }}">{{ (!empty($clsVal)?$clsVal:'') }}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                    </div>

                                </div>
                            </div>

                            <table  class="data-table table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>SL</th>
                                    <th>নাম</th>
                                    <th>মোবাইল</th>
                                    <th>এস. এস. সি ব্যাচ</th>
                                    <th>গেস্ট  </th>
                                    <th>Trans.ID  </th>
                                    <th>Net Amount </th>
                                    <th>Paid Amount</th>
                                    <th>Created At</th>
                                    <th style="width: 20%">Action</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
    <div class="modal fade" id="donationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="col-md-10">
                        <h6 class="modal-title" id="exampleModalLabel">Donation Information</h6>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="modal-body">
                    <form  action="" id="donationApprovedForm" method="post">
                        <div class="form-group">
                            <label class="control-label col-sm-12" for="donerName">Doner Name</label>
                            <div class="col-sm-12">
                                <span class="donerName"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-12" for="donerMobile">Mobile Number</label>
                            <div class="col-sm-12">
                                <div class="donerMobile"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-12" for="sscBatch">SSC Batch</label>
                            <div class="col-sm-12">
                                <div class="sscBatch"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-12" for="transactionID">Transaction Number</label>
                            <div class="col-sm-12">
                                <div class="transactionID"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-sm-12" for="donationSendedNumber">Send bKash Number</label>
                            <div class="col-sm-8">
                                <div class="donationSendedNumber"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-12" for="DonationAmount">Amount</label>
                            <div class="col-sm-8">
                                <div class="DonationAmount"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <div id="formOutput"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <input type="hidden" name="update_id" id="update_id">
                                <input type="hidden" name="currentStatus" id="currentStatus">
                                <input type="hidden" name="nextStatus" id="nextStatus">
                                <button type="button" class="btn btn-primary submit_btn" onclick="updateDonationBtn()"> <i class="fa fa-address-book" aria-hidden="true"></i> <span id="submitBtnLabel"></span></button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa
                                fa-times" aria-hidden="true"></i> Close</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@push('js_lib')
    <!-- DataTables -->
    <script src="{{ URL::asset('backend/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ URL::asset('backend/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
    <script src="{{ URL::asset('backend/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ URL::asset('backend/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
    <script src="{{ URL::asset('backend/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
    <script src="{{ URL::asset('backend/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
@endpush

@push('js_custom')
    <script>
        $(function () {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            table = $('.data-table').DataTable({
                "paging": true,
                "lengthChange": true,
                "searching": true,
                "ordering": true,
                "sorting": true,
                "processing": true,
                "language": {
                    processing: '<i class="fa fa-spinner fa-spin fa-2x fa-fw"></i><span class="sr-only">Loading...</span> '
                },
                serverSide: true,
                ajax: {
                    url: base_url + "/registered/index",
                    method: "get",
                    data: function (d) {
                        (d.status                   = $("#status").val()),
                        (d.sscBatch                 = $("#sscBatch").val()),
                        (d.className                = $("#className").val()),
                        (d.applyCtg                 = $("#applyCtg").val()),
                        (d.gender                   = $("#gender").val())
                    },
                },
                columns: [
                    {data: 'sl', name: 'sl',class: 'text-left'},
                    {data: 'name', name: 'name',class: 'text-left'},
                    {data: 'mobileNumber', name: 'mobileNumber',class: 'text-left'},
                    {data: 'sscBatch', name: 'sscBatch',class: 'text-center'},

                    {data: 'gustCount', name: 'gustCount',class: 'text-left'},
                    {data: 'TransactionID', name: 'TransactionID',class: 'text-left'},
                    {data: 'netAmount', name: 'netAmount',class: 'text-left'},
                    {data: 'store_amount', name: 'store_amount',class: 'text-right'},

                    {data: 'paid_date', name: 'paid_date',class: 'text-left'},
                    {data: 'action', name: 'action', orderable: false, searchable: false,class: 'text-center'},
                ],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });

            $("#status,#applyCtg,#sscBatch,#className,#gender").change(function () {
                table.draw();
            });

        });

        $(document).on('click', '.deleteData', function () {
            var id = $(this).data("id");
            if (confirm("Are You sure want to delete !")){
                $.ajax({
                    type: "DELETE",
                    url: "{{ route('donation.donationRecord') }}"+'/'+id,
                    success: function (data) {
                        if(data.success){
                            toastr.success(data.success);
                            table.draw();
                        }
                        else{
                            toastr.error(data.error);
                        }
                    },
                    error: function (data) {
                    }
                });

            }
        });
        function updateDoantionInfo(id){
            $("#update_id").val('');
            $("#submitBtnLabel").html('Approved');
            $('#donationApprovedForm')[0].reset();
            $(".submit_btn").attr("disabled", true);
            $("#formOutput").html('');
            $.ajax({
                type: "POST",
                url: base_url + "/donation/singleDonationInfo",
                data: {id:id},
                'dataType': 'json',
                success: function (response) {
                    if (response.status=='success') {
                        var data=response.data;
                        $(".submit_btn").attr("disabled", false);
                        $("#update_id").val(data.id);
                        $(".donerName").html(data.name);
                        $(".donerMobile").html(data.mobileNumber);
                        $(".sscBatch").html(data.sscBatch);
                        $(".transactionID").html(data.TransactionID);
                        $(".donationSendedNumber").html(data.sendNumber);
                        $(".DonationAmount").html(data.donationAmount);
                        $("#currentStatus").val(data.approvedStatus);
                        $("#nextStatus").val(2);
                    } else {

                    }
                }
            });
        }

        function updateDonationBtn(){
            $(".submit_btn").attr("disabled", true);
            $("#formOutput").html('');
            $.ajax({
                type: "POST",
                url: base_url + "/donation/updateDonation",
                data: $("#donationApprovedForm").serialize() ,
                'dataType': 'json',
                success: function (data) {
                    $(".submit_btn").attr("disabled", false);
                    if(data.success){
                        $('#donationModal').modal('toggle');
                        toastr.success(data.success);
                        table.draw();
                    }
                    else{
                        toastr.error(data.error);
                    }


                }
            });
        }
    </script>
@endpush
<style>
    .table td{
        font-size: 13px !important;
    }
    .table th{
        font-size: 11px !important;
    }
</style>

