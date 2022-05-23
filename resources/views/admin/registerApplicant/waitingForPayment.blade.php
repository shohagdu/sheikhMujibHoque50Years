@extends('admin.layouts.app')
@push('css_lib')
    <!-- DataTables -->
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}"/>
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}"/>
    <link rel="stylesheet" href="{{ URL::asset('backend/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}"/>
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
                                    <form  action="" id="confirmRegistrationForm" class="form-horizontal" method="post">
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


