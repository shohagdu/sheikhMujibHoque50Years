@extends('admin.layouts.app')
@push('css_lib')
    <!-- DataTables -->
{{--    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}"/>--}}
{{--    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}"/>--}}
{{--    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}"/>--}}

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
@endpush
@php
    $userType               = (!empty(Auth::user()->user_type)?Auth::user()->user_type:'');
    $applicantInfo          = (!empty($data['applicantInfo'])?$data['applicantInfo']:'');
    $userInfo               = (!empty($data['userInfo'])?$data['userInfo']:'');
    $guestInfo              = (!empty($data['guestInfo'])?$data['guestInfo']:'');
    $classInfo=[
        6=>'৬ষ্ঠ',
        7=>'৭ম',
        8=>'৮ম',
        9=>'৯ম',
        10=>'১০ম (নতুন)',
        11=>'১০ম (পুরাতন)',
    ]
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
{{--                                    {{ dd($applicantInfo) }}--}}
                                    @if(!empty($applicantInfo->applyType) && $applicantInfo->applyType==2 &&
                                    $applicantInfo->netAmount<=0 )

                                        @if(!empty($applicantInfo->isApprovedAuthority) && $applicantInfo->isApprovedAuthority==1)
                                            <h4 class=" text-center font-weight-bold" style="color:green">আপনি বর্তমান শিক্ষার্থী
                                                ক্যাটাগরিতে আবেদন করেছেন। আপনার আবেদনটি এখনও Approved করা হয় নি।
                                                কর্তৃপক্ষ খুব  শ্রীঘ্রই  আপনার আবেদনটি  Approved করা হবে।</h4>
                                        @elseif(!empty($applicantInfo->isApprovedAuthority) && $applicantInfo->isApprovedAuthority==1)
                                            <h4 class=" text-center font-weight-bold" style="color:green">ধন্যবাদ, আবেদনটি  Approved
                                                করা হয়েছে। অনুষ্ঠান সম্পর্কে খুব শ্রীঘ্রই আপডেট পাবেন। </h4>
                                        @else

                                        @endif
                                        <div class="text-center">
                                            <a href="{{ url('admin/dashboard/') }}" class="btn btn-warning btn-lg
                                        text-center"><i class="fa  fa-angle-left"></i> Back to Dashboard </a>
                                        </div>
                                    @else
                                    <h5 class="text-center color-red font-weight-bold">আপনার তথ্য গুলো যাচাই করার পর নিচের <span
                                        class="color-green">PAY NOW </span>বাটনে
                                        ক্লিক করার
                                        মাধ্যমে
                                        আপনার
                                        রেজিস্ট্রেশন প্রক্রিয়া সম্পন্ন করুন</h5>
                                    @endif
                                    <hr/>
{{--                                    <form  action="" id="confirmRegistrationForm" class="form-horizontal" method="post">--}}
                                        <div class="col-sm-12 row">
                                            <div class="col-sm-3 text-center">
                                                <img src="{{ (file_exists($applicantInfo->picture))?url(
                                                $applicantInfo->picture):url
                                                ('backend/images/avatar.jpg') }}"
                                                     class="img-thumbnail"
                                                     style="height:
                                                130px">
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
                                        <table class="table table-bordered">
                                            <tr>
                                                <th>সদস্য ধরন</th>
                                                <td>{{ !empty($applicantInfo->applyTypeCtg)
                                                ?$applicantInfo->applyTypeCtg:'' }} {{ !empty
                                                ($applicantInfo->applyTypeAmount)?"
                                                (".$applicantInfo->applyTypeAmount.")":'' }}</td>
                                                <th>টি শার্ট সাইজ</th>
                                                <td>{{ !empty($applicantInfo->tShirtSize)?$applicantInfo->tShirtSize:'' }}</td>
                                            </tr>
                                            <tr>
                                                <th>পিতা/স্বামীর নাম</th>
                                                <td>{{ !empty($applicantInfo->fatherHusbandName)?$applicantInfo->fatherHusbandName:'' }}</td>
                                                <th>লিংঙ্গ</th>
                                                <td>{{ !empty($applicantInfo->gender)?(($applicantInfo->gender==1)
                                                ?"পুরুষ":"মহিলা"):''
                                                }}</td>
                                            </tr>
                                             <tr>
                                                <th>ঠিকানা</th>
                                                <td colspan="3">{{ !empty($applicantInfo->address)
                                                ?$applicantInfo->address:'' }}</td>
                                            </tr>
                                            @if(!empty($applicantInfo->applyType) && $applicantInfo->applyType==1 ||
                                            $applicantInfo->applyType==3 )
                                                <tr>
                                                    <th>পেশা</th>
                                                    <td>{{ !empty($applicantInfo->occupationTitle)
                                                    ?$applicantInfo->occupationTitle:'' }}</td>
                                                    <th>কর্মস্থল</th>
                                                    <td>{{ !empty($applicantInfo->workPlace)
                                                    ?$applicantInfo->workPlace:'' }}</td>
                                                </tr>
                                            @elseif($applicantInfo->applyType==2)
                                                <tr>
                                                    <th>শ্রেণী</th>
                                                    <td>{{ !empty($classInfo[$applicantInfo->class_name])
                                                    ?$classInfo[$applicantInfo->class_name]:'' }}</td>
                                                    <th>রোল নং</th>
                                                    <td>{{ !empty($applicantInfo->roll_no)?$applicantInfo->roll_no:'' }}</td>
                                                </tr>
                                            @endif
                                        </table>


                                            <div class="table-responsive">
                                                <table style="width: 100%" class="table table-bordered">
                                                    <thead>
                                                    <tr>
                                                        <th colspan="5" class="text-center">পারিবারিক সদস্যদের তথ্য</th>
                                                    </tr>
                                                    <tr>
                                                        <th style="width: 5%">#</th>
                                                        <th style="width: 25%">সম্পর্ক</th>
                                                        <th style="width: 30%">নাম</th>
                                                        <th style="width: 20%">মোবাইল নম্বর</th>
                                                        <th style="width: 20%">টাকা</th>
                                                    </tr>

                                                    </thead>
                                                    <tbody id="dynamicTableGust">
                                                    @php($i=1)
                                                    @if(!empty($guestInfo))
                                                        @foreach($guestInfo as $guest)
                                                            <tr>
                                                                <td>{{ $i++ }}</td>
                                                                <td>{{ (!empty($guest->gustCtgTitle)?$guest->gustCtgTitle:'')
                                                                }}</td>
                                                                <td>{{ (!empty($guest->name)?$guest->name:'')
                                                                }}</td>
                                                                <td>{{ (!empty($guest->mobile)?$guest->mobile:'')
                                                                }}</td>
                                                                <td class="text-right">{{ (!empty($guest->amount)
                                                                ?$guest->amount:'')
                                                                }}</td>
                                                            </tr>
                                                        @endforeach
                                                    @endif
                                                    </tbody>
                                                    <tfoot>
                                                    <tr>
                                                        <th colspan="4" class="text-right">পারিবারিক সদস্যদের ফি</th>
                                                        <td  class="text-right">
                                                            {{ !empty($applicantInfo->guestRegCrg)
                                                            ?$applicantInfo->guestRegCrg:'0.00' }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="4" class="text-right">সদস্য নিবন্ধন ফি</th>
                                                        <td  class="text-right">
                                                            {{ !empty($applicantInfo->applicantRegCrg)
                                                            ?$applicantInfo->applicantRegCrg:'0.00' }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="4" class="text-right color-green"> নিবন্ধন
                                                            (পারিবারিক
                                                            সদস্যদের+সদস্য) ফি</th>
                                                        <td  class="text-right">
                                                            {{ !empty($applicantInfo->totalRegCrg)
                                                            ?$applicantInfo->totalRegCrg:'0.00' }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="4" class="text-right">অনলাইন ট্রানজেশন ফি
                                                            ({{ !empty($applicantInfo->transactionPer)
                                                            ?$applicantInfo->transactionPer:'2.50 %' }})</th>
                                                        <td class="text-right">
                                                            {{ !empty($applicantInfo->transactionFeesAmnt)
                                                            ?$applicantInfo->transactionFeesAmnt:'0.00' }}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="4" class="text-right  color-red">সর্বমোট
                                                            নিবন্ধন  ফি</th>
                                                        <td  class="text-right">
                                                            {{ !empty($applicantInfo->netAmount)
                                                            ?$applicantInfo->netAmount:'0.00' }}
                                                        </td>
                                                    </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                            <div class=" text-center">
                                                @if(!empty($applicantInfo->paidStatus) &&
                                                $applicantInfo->paidStatus==1 &&
                                    $applicantInfo->netAmount > 0 )
                                                    <button type="button" class="btn btn-success" id="sslczPayBtn"
                                                            token="if you have any token validation"
                                                            postdata="your javascript arrays or objects which requires in backend"
                                                            order="If you already have the transaction generated for current order"
                                                            endpoint="{{ url('/pay-via-ajax') }}"> Pay Now
                                                    </button>
                                                @endif
                                            </div>

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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
@endpush
@push('js_custom')
    <script>

        var obj = {};
        obj.paymentID = '<?php echo Request::segment(3); ?>';
        obj.paymentID = '<?php echo (!empty($applicantInfo->invoiceIDs)?$applicantInfo->invoiceIDs:'') ?>';
        obj.transId = '<?php echo (!empty($applicantInfo->transId)?$applicantInfo->transId:'') ?>';
        obj.invoiceId = '<?php echo (!empty($applicantInfo->invoiceId)?$applicantInfo->invoiceId:'') ?>';
        obj.cus_name = '<?php echo (!empty($applicantInfo->name)?$applicantInfo->name:'') ?>';
        obj.cus_phone = '<?php echo (!empty($applicantInfo->mobileNumber)?$applicantInfo->mobileNumber:'') ?>';
        obj.cus_email = '<?php echo (!empty($applicantInfo->emailAddress)?$applicantInfo->emailAddress:'') ?>';
        obj.cus_addr1 = '<?php echo (!empty($applicantInfo->address)?$applicantInfo->address:'') ?>';
        obj.amount = '<?php echo (!empty($applicantInfo->netAmount)?$applicantInfo->netAmount:'') ?>';

        $('#sslczPayBtn').prop('postdata', obj);

        (function (window, document) {
            var loader = function () {
                var script = document.createElement("script"), tag = document.getElementsByTagName("script")[0];
                 script.src = "https://seamless-epay.sslcommerz.com/embed.min.js?" + Math.random().toString(36).substring(7); // USE THIS FOR LIVE
             //   script.src = "https://sandbox.sslcommerz.com/embed.min.js?" + Math.random().toString(36).substring
                //   (7);
                // USE THIS FOR SANDBOX
                tag.parentNode.insertBefore(script, tag);
            };

            window.addEventListener ? window.addEventListener("load", loader, false) : window.attachEvent("onload", loader);
        })(window, document);
    </script>
@endpush
<style>
    .table td{
        padding-top: 4px!important;
        padding-bottom: 4px!important;
    }
    .table th{
        padding-top: 4px!important;
        padding-bottom: 4px!important;
    }
    .color-green{
        color:green!important;
    }
    .color-red{
        color:red!important;
    }
</style>


