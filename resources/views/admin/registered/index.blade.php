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
                                        <select name="paymentStatus" id="paymentStatus" class="form-control">
                                          <option value="">Payment Status</option>
                                          <option value="2">Approved (Paid)</option>
                                          <option value="1">Pending</option>
                                          <option value="3">Cancelled</option>
                                          <option value="4">Declined (Not Approved Student)</option>
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
                                    <th>Status</th>
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
                        <h6 class="modal-title" id="exampleModalLabel">Registered Applicant Information</h6>
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
                            <h4 class="text-center">Payment Pending</h4>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-sm-2" for="donerName"> Name</label>
                                <div class="col-sm-4">
                                    <span class="donerName"></span>
                                </div>
                                <label class="control-label col-sm-2" for="donerMobile">Mobile Number</label>
                                <div class="col-sm-4">
                                    <div class="donerMobile"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-sm-2" for="fatherHusbandName">Father/Husband</label>
                                <div class="col-sm-4">
                                    <div class="fatherHusbandName"></div>
                                </div>
                                <label class="control-label col-sm-2" for="sscBatch">SSC Batch</label>
                                <div class="col-sm-4">
                                    <div class="sscBatch"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-sm-2" for="address">ঠিকানা</label>
                                <div class="col-sm-10">
                                    <div class="address"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="row">
                                <label class="control-label col-sm-2" for="className">শ্রেণী</label>
                                <div class="col-sm-4">
                                    <div class="className"></div>
                                </div>
                                <label class="control-label col-sm-2" for="classRollNo">রোল নং</label>
                                <div class="col-sm-4">
                                    <div class="classRollNo"></div>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered">
                            <tr>
                                <th class="text-right">পারিবারিক সদস্যদের ফি</th>
                                <td  class="text-right">
                                    <div class="familyMemberRegfees"></div>
                                </td>
                            </tr>
                            <tr>
                                <th  class="text-right">সদস্য নিবন্ধন ফি</th>
                                <td  class="text-right">
                                    <span class="ownRegFees"></span>
                                </td>
                            </tr>
                            <tr>
                                <th  class="text-right color-green"> নিবন্ধন
                                    (পারিবারিক
                                    সদস্যদের+সদস্য) ফি</th>
                                <td  class="text-right">
                                    <span class="ownRegFamilyMemberFees"></span>
                                </td>
                            </tr>
                            <tr>
                                <th  class="text-right">অনলাইন ট্রানজেশন ফি
                                </th>
                                <td class="text-right">
                                    <span class="onlineTransFees"></span>
                                </td>
                            </tr>
                            <tr>
                                <th  class="text-right  color-red" style="color: red;font-weight:
                                    bold">সর্বমোট
                                    নিবন্ধন  ফি</th>
                                <td  class="text-right">
                                    <span class="TotalRegFees"></span>
                                </td>
                            </tr><tr>
                                <th  class="text-right " style="color: green;font-weight: bold">সর্বমোট
                                    প্রদানকৃত</th>
                                <td  class="text-right">
                                    <span class="paidAmount"></span>
                                </td>
                            </tr>
                        </table>





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
                        (d.paymentStatus                   = $("#paymentStatus").val()),
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

                    {data: 'created_at', name: 'created_at',class: 'text-left'},
                    {data: 'approvedStatus', name: 'approvedStatus',class: 'text-left'},
                    {data: 'action', name: 'action', orderable: false, searchable: false,class: 'text-center'},
                ],
                "info": true,
                "autoWidth": false,
                "responsive": true,
            });

            $("#paymentStatus,#applyCtg,#sscBatch,#className,#gender").change(function () {
                table.draw();
            });

        });

        $(document).on('click', '.deleteData', function () {
            var id = $(this).data("id");
            if (confirm("Are You sure want to delete !")){
                $.ajax({
                    type: "post",
                    data:{id:id},
                    url: "{{ route('registered.destroy') }}",
                    success: function (data) {
                        if(data.success){
                            toastr.success(data.success);
                            tableUser.draw();
                        }
                        else{
                            toastr.error(data.error);
                        }
                    },
                    error: function (data) {
                        //console.log('Error:', data);
                    }
                });

            }
        });
        function updateRegistredAppInfo(id){
            $("#update_id").val('');
            $("#submitBtnLabel").html('Approved');
            $('#donationApprovedForm')[0].reset();
            $(".submit_btn").attr("disabled", true);
            $("#formOutput").html('');
            $.ajax({
                type: "POST",
                url: base_url + "/registered/singleApplicantInfo",
                data: {id:id},
                'dataType': 'json',
                success: function (response) {
                    if (response.status=='success') {
                        var data=response.data;
                        console.log(data);
                        $(".submit_btn").attr("disabled", false);
                        $("#update_id").val(data.applicantId);
                        $(".donerName").html(data.name);
                        $(".donerMobile").html(data.mobileNumber);
                        $(".sscBatch").html(data.sscBatch);
                        $(".fatherHusbandName").html(data.fatherHusbandName);
                        $(".address").html(data.address);
                        $(".className").html(data.class_name);
                        $(".classRollNo").html(data.roll_no);
                        $(".familyMemberRegfees").html(data.guestRegCrg);
                        $(".ownRegFees").html(data.applicantRegCrg);
                        $(".ownRegFamilyMemberFees").html(data.totalRegCrg);
                        $(".onlineTransFees").html(data.transactionFeesAmnt);
                        $(".TotalRegFees").html(data.netAmount);
                        $(".paidAmount").html(data.paidAmnt);
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
                url: base_url + "/registered/updateDonation",
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

