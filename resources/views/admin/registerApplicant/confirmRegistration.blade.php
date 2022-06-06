@extends('admin.layouts.app')
@push('css_lib')
    <!-- DataTables -->
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}"/>
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}"/>
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}"/>
@endpush
@php
    $userType         = (!empty(Auth::user()->user_type)?Auth::user()->user_type:'');
    $profession       = (!empty($data['profession'])?$data['profession']:'');
    $userType         = (!empty($data['userType'])?$data['userType']:'');
    $applicantInfo    = (!empty($data['applicantInfo'])?$data['applicantInfo']:'');
    $userInfo         = (!empty($data['userInfo'])?$data['userInfo']:'');
    $applicantApplyType= (!empty($data['applicantApplyType'])?$data['applicantApplyType']:'');
    $gustApplyType    = (!empty($data['gustApplyType'])?$data['gustApplyType']:'');
    $tShirtSize=[
        'S','M','L','XL','XXL'
    ];
@endphp
@section('content')
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title"><i class="fas fa-th-list"></i> {{ (!empty($data['page_title'])
                            ?$data['page_title']:'')
                            }}</h3>
                            <div class="card-tools">
                                <a href="{{ url('admin/dashboard') }}" class="btn btn-danger btn-sm" >    <i class="fa
                                        fa-backward"></i> Back</a>

                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-12">

                                    <form  action="" id="confirmRegistrationForm" class="form-horizontal" method="post">
                                        <div class="col-sm-12 row">
                                            <div class="col-sm-3 text-center" id="img_div">
                                                <img src="{{ url('backend/images/avatar.jpg') }}" class="img-thumbnail"
                                                     style="height:
                                                130px" id="img_id">
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group row">
                                                    <div class="col-sm-6">
                                                        <label class="control-label " for="name">নাম</label>
                                                        <div class="clearfix"></div>
                                                       {{ !empty($applicantInfo->name)?$applicantInfo->name:'' }}
                                                    </div>
                                                    <div class="col-sm-6">
                                                        <label class="control-label " for="name">মোবাইল</label>
                                                        <div class="clearfix"></div>
                                                        {{ (!empty($userInfo->email)?$userInfo->email:'') }}
                                                    </div>

                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-6">
                                                        <label class="control-label" for="mobile">এস.এস.সি'র  ব্যাচ</label>
                                                        <div class="clearfix"></div>
                                                        {{ !empty($applicantInfo->sscBatch)?$applicantInfo->sscBatch:'' }}
                                                    </div>
                                                    <!--
                                                    <div class="col-sm-6">
                                                        <label class="control-label " for="name">মোবাইল</label>
                                                        <div class="clearfix"></div>
                                                        {{ (!empty($userInfo->mobile)?$userInfo->mobile:'') }}
                                                    </div>
                                                    -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12" style="height: 20px"></div>

                                        <div class="form-group row">
                                            <label class=" col-sm-2 text-center" for="gender">সদস্য ধরন</label>
                                            <div class="col-sm-10">
                                                <select name="applyType" id="applyType" class="form-control">
                                                    <option value="">সদস্য ধরন চিহ্নিত করুন</option>
                                                    @if(!empty($applicantApplyType))
                                                        @foreach($applicantApplyType as $appTypeKey=> $applyType)
                                                            <option value="{{ $appTypeKey }}">{{ $applyType  }}</option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                                <div id="presentStudentApprovedMsg"></div>
                                            </div>

                                        </div>
                                        <div class="form-group row">
                                            <label class=" col-sm-2 text-center" for="gender">ছবি</label>
                                            <div class="col-sm-4">
                                                <input type="file" name="picture" id="picture" class="form-control" accept="image/jpeg, image/jpg, image/png"
                                                       onchange="LoadFile(event);">
                                            </div>
                                            <label class=" col-sm-2 text-center" for="tShirtSize">ড্রেস সাইজ
                                                (টিশার্ট)</label>
                                            <div class="col-sm-4">
                                                <select name="tShirtSize" id="tShirtSize" class="form-control">
                                                    <option value="">টিশার্ট এর সাইজ চিহ্নিত করুন</option>
                                                    @if(!empty($tShirtSize))
                                                        @foreach($tShirtSize as $tSizeKey=> $tSize)
                                                            <option value="{{ $tSize }}">{{ $tSize  }}</option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                            </div>
                                            <div id="presentStudentApprovedMsg"></div>
                                        </div>

                                        <div class="form-group row">
                                            <label class=" col-sm-2 text-center" for="gender">পিতা/স্বামীর নাম</label>
                                            <div class="col-sm-2">
                                                <select name="isFatherHusband" id="isFatherHusband" class="form-control">
                                                    <option value="1">পিতা</option>
                                                    <option value="2">স্বামী</option>
                                                </select>
                                            </div>
                                            <div class="col-sm-8">
                                                <input type="text" name="fatherHusbandName" id="fatherHusbandName" placeholder="পিতা/স্বামীর নাম"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="control-label col-sm-2 text-center " for="Remarks">ঠিকানা</label>
                                            <div class="col-sm-10">
                                                <textarea  placeholder="বাড়ির নাম" name="present_address"
                                                          id="present_address"
                                                           class="form-control">#গ্রাম:   &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; #পো:&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;# থানা: ফেনী সদর # জেলা: ফেনী ।
                                                </textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class=" col-sm-2 text-center" for="gender">লিংঙ্গ</label>
                                            <div class="col-sm-4">
                                                <select name="gender" id="gender" class="form-control">
                                                    <option value="">লিংঙ্গ চিহ্নিত করুন</option>
                                                    <option value="1">পুরুষ</option>
                                                    <option value="2">মহিলা</option>
                                                </select>
                                            </div>
                                            <label class="control-label col-sm-2 text-center pastStudent " style="display: none;"
                                                   for="currentProfession">পেশা </label>
                                            <div class="col-sm-4 pastStudent" style="display: none;">
                                                <select name="currentProfession" id="currentProfession" class="form-control">
                                                    <option value="">পেশা চিহ্নিত করুন</option>
                                                    @if(!empty($profession))
                                                        @foreach($profession as $profesKey=> $profs)
                                                            <option value="{{ $profesKey }}">{{ $profs  }}</option>
                                                        @endforeach
                                                    @endif
                                                </select>
                                            </div>

                                        </div>
                                        <div class="form-group row pastStudent" style="display: none;" >
                                            <label class="control-label col-sm-2 text-center " for="Remarks">কর্মস্থল</label>
                                            <div class="col-sm-10">
                                                <textarea type="text" name="currentProfessionDetails"
                                                          placeholder="বর্তমান কর্মস্থল সম্পর্কে তথ্য প্রদান করুন"
                                          id="currentProfessionDetails"
                                          class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row runningStudent" style="display: none;">
                                            <label class=" col-sm-2 text-center" for="className">শ্রেণী</label>
                                            <div class="col-sm-4">
                                                <select name="className" id="className" class="form-control">
                                                    <option value="">শ্রেণী চিহ্নিত করুন</option>
                                                    <option value="6">৬ষ্ঠ</option>
                                                    <option value="7">৭ম</option>
                                                    <option value="8">৮ম</option>
                                                    <option value="9">৯ম</option>
                                                    <option value="10">১০ম (নতুন)</option>
                                                    <option value="11">১০ম (পুরাতন)</option>
                                                </select>
                                            </div>
                                            <label class="control-label col-sm-2 text-center "
                                                   for="currentProfession">রোল নং </label>
                                            <div class="col-sm-4">
                                                <input type="text" placeholder="রোল নং" name="rollNo" id="rollNo"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="table-responsive">
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th colspan="5" class="text-center">পারিবারিক সদস্যদের তথ্য</th>
                                                        </tr>
                                                        <tr>
                                                            <th style="width: 25%">সম্পর্ক</th>
                                                            <th style="width: 30%">নাম</th>
                                                            <th>মোবাইল নম্বর</th>
                                                            <th style="width: 20%">টাকা</th>
                                                            <th style="width: 10%">#</th>
                                                        </tr>

                                                    </thead>
                                                    <tbody id="dynamicTableGust">

                                                    </tbody>
                                                    <tfoot>
                                                        <tr>
                                                            <td colspan="2">
                                                                <button type="button" id="btn_AddToList" class="btn btn-info submit_btn" > <i class="fa fa-plus"aria-hidden="true"></i>
                                                                    নতুন পারিবারিক সদস্য </button>
                                                            </td>
                                                            <th class="text-right">পারিবারিক সদস্যদের ফি</th>
                                                            <td colspan="2">
                                                                <input value="0.00" readonly type="text" placeholder="টাকার
                                                                পরিমান"
                                                                         name="guestRegTotalAmnt"
                                                                         id="guestRegTotalAmnt"
                                                                         class="form-control">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="3" class="text-right">সদস্য নিবন্ধন ফি</th>
                                                            <td colspan="2">
                                                                <input value="0.00" readonly type="text" placeholder="সদস্য নিবন্ধন ফি"
                                                                         name="applicantRegAmnt"
                                                                         id="applicantRegAmnt"
                                                                         class="form-control">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="3" class="text-right color-green"> নিবন্ধন
                                                                (পারিবারিক
                                                                সদস্যদের+সদস্য) ফি</th>
                                                            <td colspan="2">
                                                                <input value="0.00" readonly  type="text" placeholder="সদস্য
                                                                নিবন্ধন ফি"
                                                                         name="applicantGuestAmnt"
                                                                         id="applicantGuestAmnt"
                                                                         class="form-control">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="3" class="text-right">অনলাইন ট্রানজেশন ফি
                                                                (২.৫ %)</th>
                                                            <td colspan="2">
                                                                <input value="0.00"  readonly type="text"
                                                                       placeholder="অনলাইন
                                                                 ট্রানজেশন ফি"
                                                                         name="onlineTransFeeAmnt"
                                                                         id="onlineTransFeeAmnt"
                                                                         class="form-control">
                                                            </td>
                                                        </tr>
                                                    <tr>
                                                            <th colspan="3" class="text-right  color-red">সর্বমোট
                                                                নিবন্ধন  ফি</th>
                                                            <td colspan="2">
                                                                <input value="0.00" readonly type="text" placeholder="সর্বমোট
                                                                 নিবন্ধন  ফি"
                                                                         name="netFeeAmnt"
                                                                         id="netFeeAmnt"
                                                                         class="form-control">
                                                            </td>
                                                        </tr>





                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>





                                        <div class="form-group row">
                                            <div class="col-sm-4">
                                                <div id="formOutput"></div>
                                            </div>
                                            <div class="col-sm-4">
                                                <input type="hidden" value="{{ (!empty($applicantInfo->id)
                                                ?$applicantInfo->id:'') }}"
                                                       name="appID" id="appID">
                                                <input type="hidden" value="{{ (!empty($applicantInfo->user_id)
                                                ?sha1($applicantInfo->user_id):'') }}"
                                                       name="userID" id="userID">

                                                <input type="hidden" name="update_id" id="update_id">
                                                <button type="submit" class="btn btn-success submit_btn btn-lg
                                                btn-block"
                                                > <i
                                                        class="fa fa-address-book" aria-hidden="true"></i>
                                                    Submit</button>
                                            </div>
                                        </div>

                                    </form>


                                </div>
                            </div>

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
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
        var scntDiv = $('#dynamicTableGust');
        var i = 101;
        $('#btn_AddToList').on('click', function () {
            $(`
            <tr>
                <td>
                    <select name="guestApplyType[]" id="guestApplyType_${i}" class="form-control">
                        <option value="">সম্পর্ক</option>
                        @if(!empty($gustApplyType))
                            @foreach($gustApplyType as $gustAppTypeKey=> $gustAppType)
                            <option value="{{ $gustAppTypeKey }}">{{ $gustAppType  }}</option>
                            @endforeach
                        @endif
                     </select>
                 </td>
                 <td>
                    <input  type="text" placeholder="নাম" name="guestName[]"
                            id="guestName_${i}"
                            class="form-control">
                </td>
                <td>
                    <input  type="text" placeholder="মোবাইল নং"
                            name="guestMobile[]"
                            id="guestMobile_${i}"
                            class="form-control">
                </td>
                <td>
                    <input  type="text" placeholder="টাকার পরিমান"
                            name="guestTaka[]" value="500.00" readonly
                            id="guestTaka_${i}"
                            class="form-control guestAmnt">
                </td>
                <td>
                    <button type="button" id="delete_${i}" class="btn  btn-danger deleteRow btn-lg" > <i class="fa fa-times" ></i></button>
                </td>
            </tr>`).appendTo(scntDiv);
            findTotals();
            i++;
            return false;
        });

        $(document).on("click", ".deleteRow", function (e) {
            var target = e.target;
            $(target).closest('tr').remove();
            findTotals();
        });

        function findTotals() {
                var transactionPercentage='2.5';
                var row_total = 0;
                $("td .guestAmnt").each(function () {
                    row_total += Number($(this).val());
                });
                $("#guestRegTotalAmnt").val(row_total.toFixed(2));
                var applicantRegAmnt            = parseFloat($("#applicantRegAmnt").val());
                var applicantWithGustAmnt       = (row_total+applicantRegAmnt);
                var transactionFees             = ((transactionPercentage/100)*applicantWithGustAmnt);
                var transFees                   = ((transactionPercentage/100)*transactionFees)
                var tProcessingFees             =  Math.ceil(transactionFees+transFees);
                $("#applicantGuestAmnt").val(applicantWithGustAmnt.toFixed(2));
                $("#onlineTransFeeAmnt").val(tProcessingFees.toFixed(2));
                $("#netFeeAmnt").val((row_total+applicantRegAmnt+tProcessingFees).toFixed(2));
        }


        $(document).on("change", "#applyType", function (event) {
            $("#presentStudentApprovedMsg").html('');
            $(".pastStudent").hide();
            $(".runningStudent").hide();
            var applyTypeID = $(this).val();
            var applyTypeAmnt = '0.00';
            if(applyTypeID==2){
               var applyTypeAmnt = '0.00';
               $("#presentStudentApprovedMsg").html('যেহেতু আপনি "সদস্য ধরন বর্তমান শিক্ষার্থী" চিহ্নিত করেছেন।  ' +
                   'কতৃপক্ষের Approved করার মাধ্যমে আপনার আবেদন প্রক্রিয়া সম্পন্ন হবে');
                $("#presentStudentApprovedMsg").css({"color":"red","font-weight":"bold","margin-top":"8px",
                    "text-align":"center"});
                $(".runningStudent").show();
            }else if(applyTypeID==1 || applyTypeID==3){
                var applyTypeAmnt = '500.00';
                $(".pastStudent").show();
            }
            $("#applicantRegAmnt").val(applyTypeAmnt);
            findTotals();
        });

        $("#confirmRegistrationForm").on('submit', (function (e) {
            $(".submit_btn").attr("disabled", true);
            var formData = new FormData(this)

            e.preventDefault();
            $.ajax({
                url: base_url + "/confirmRegistrationStore",
                type: "POST",
                data: formData,
                contentType: false,
                cache: false,
                processData: false,
                'dataType': 'json',
                success: function (data) {
                    $(".submit_btn").attr("disabled", false);
                    if(data.success){
                        toastr.success(data.success);
                        console.log(data);
                        setTimeout(function(){
                            window.location = base_url +data.redirectTo;
                        },1500);
                    } else{
                        if (data.error.length > 0) {
                            var error_html = '';
                            for (var count = 0; count < data.error.length; count++) {
                                error_html += '<div class="alert alert-danger">' + data.error[count] + '</div> <br/>';
                            }
                            toastr.error(error_html);
                        }else {
                            toastr.error(data.error);
                        }
                    }


                }
            });
        }));

        var LoadFile = function (event) {
            var output = document.getElementById("img_id");
            document.getElementById("img_div").style.display = "block";
            output.src = URL.createObjectURL(event.target.files[0]);
        }

    </script>
@endpush
<style>
    .table td{
        font-size: 13px !important;
    }
    .table th{
        font-size: 13px !important;
    }
    .color-green{
        color:green!important;
    }
    .color-red{
        color:red!important;
    }
</style>

