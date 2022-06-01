<div class="card">
    <div class="card-header">
            <h5 class="card-title"><i class="fas fa-th-list"></i> <?php echo (!empty($page_title)?$page_title:'')  ?></h5>
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
                @else
                    <h5 class="text-center color-red font-weight-bold">ধন্যবাদ, আপনার পেমেন্ট
                        প্রক্রিয়া সফলতার সাথে সম্পন্ন  হয়েছে। অনুষ্ঠান সম্পর্কে খুব শ্রীঘ্রই আপডেট পাবেন।</h5>
                @endif
                <hr/>
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
                                    {{ (!empty($applicantInfo->mobileNumber)?$applicantInfo->mobileNumber:'') }}
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
                                <th colspan="4" class="text-right">অনলাইন ট্রানজেশন ফি</th>
                                <td class="text-right">
                                    {{ !empty($applicantInfo->transactionFeesAmnt)
                                    ?$applicantInfo->transactionFeesAmnt:'0.00' }}
                                </td>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-right  color-red" style="color: red;font-weight:
                                bold">সর্বমোট
                                    নিবন্ধন  ফি</th>
                                <td  class="text-right">
                                    {{ !empty($applicantInfo->netAmount)
                                    ?$applicantInfo->netAmount:'0.00' }}
                                </td>
                            </tr><tr>
                                <th colspan="4" class="text-right  color-red" style="color: green;font-weight: bold">সর্বমোট
                                    প্রদানকৃত</th>
                                <td  class="text-right">
                                    {{ !empty($applicantInfo->paidAmnt)
                                    ?$applicantInfo->paidAmnt:'0.00' }}
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    <div class=" text-center">
                        <div class="text-center">
                            <a href="{{ url('admin/login') }}" class="btn btn-info btn-lg
                                        text-center">Login Now  </a>
                        </div>
                    </div>

                </form>

            </div>
        </div>

    </div>
    <!-- /.card-body -->
</div>
