<div >
    <div class="card-body">
        <div class="row">
            <div class="col-md-4 text-center">
                <img src="{{ (file_exists($applicantInfo->picture) && !empty($applicantInfo->picture) )?url(
                                                $applicantInfo->picture):url
                                                ('backend/images/avatar.jpg') }}" style="height: 200px">
            </div>
            <div class="col-md-8">
                <div class="d-flex  align-items-center border-bottom mb-3">
                    <p class="d-flex flex-column ">
                         <span class="font-weight-bold">
                            <i class="ion ion-android-arrow-up text-success"></i> {{ (!empty($userInfo->name)?$userInfo->name:'') }}
                        </span>
                        <span class="text-muted">Name</span>
                    </p>
                </div>
                <div class="d-flex  align-items-center border-bottom mb-3">
                    <p class="text-warning text-xl">
                        <i class="ion ion-ios-cart-outline"></i>
                    </p>
                    <p class="d-flex flex-column ">
                        <span class="font-weight-bold">
                        <i class="ion ion-android-arrow-up text-warning"></i> {{ (!empty($userInfo->email)?$userInfo->email:'') }}
                        </span>
                        <span class="text-muted">Mobile</span>
                    </p>
                </div>

                <div class="d-flex  align-items-center mb-0">
                    <p class="text-danger text-xl">
                        <i class="ion ion-ios-people-outline"></i>
                    </p>
                    <p class="d-flex flex-column ">
                        <span class="font-weight-bold">
                        <i class="ion ion-android-arrow-down text-danger"></i> {{ (!empty($userInfo->mobile)?$userInfo->mobile:'') }}
                        </span>
                        <span class="text-muted">Email </span>
                    </p>
                </div>
            </div>
            <div class="col-sm-12 text-center" style="margin-top:20px">
{{--                {{ dd($applicantInfo) }}--}}
                @if(!empty($applicantInfo->approved_status) && $applicantInfo->approved_status==1 && empty($applicantInfo->invoiceIDs))
                    <div class="alert alert-info" role="alert">
                        আপনার প্রাথমিক রেজিস্ট্রেশন সম্পন্ন হয়েছে।  আপনার কিছু তথ্য প্রদান করে পেমেন্ট
                        প্রক্রিয়া সম্পন্ন করতে হবে। পেমেন্ট প্রক্রিয়া সম্পন্ন করতে নিচের "Registration Confirm" বাটনে
                        ক্লিক করুন
                    </div>
                    <a href="{{ url('admin/confirmRegistration/'.$userInfo->id) }}" class="btn btn-success btn-lg
                    text-center">  Confirm Registration <i class="fa  fa-angle-right"></i></a>
                @elseif(!empty($applicantInfo->approved_status) && $applicantInfo->approved_status==2 && !empty
                ($applicantInfo->invoiceIDs))
                    <div class="alert alert-primary" role="alert">
                        আপনার Invoice Generate সম্পন্ন হয়েছে।  আপনাকে পেমেন্ট
                        প্রক্রিয়া সম্পন্ন করতে হবে। পেমেন্ট প্রক্রিয়া পুরোপুরি সম্পন্ন করতে নিচের "Payment Confirm"
                        বাটনে
                        ক্লিক করুন
                    </div>
                    <a href="{{ url('admin/waitingForPayment/'.$applicantInfo->invoiceIDs) }}" class="btn btn-success
                     btn-lg  text-center"> Payment Confirm <i class="fa  fa-angle-right"></i></a>
                @elseif(!empty($applicantInfo->approved_status) && $applicantInfo->approved_status==3 && !empty
                ($applicantInfo->invoiceIDs))
                    <hr/>

                    @if(!empty($applicantInfo->applyType) && $applicantInfo->applyType==1 ||
                    $applicantInfo->applyType==3 )
                        <h4 class=" text-center font-weight-bold" style="color:green">ধন্যবাদ, আপনার পেমেন্ট
                            প্রক্রিয়া সফলতার সাথে সম্পন্ন  হয়েছে। অনুষ্ঠান সম্পর্কে খুব শ্রীঘ্রই আপডেট পাবেন।
                        </h4>
                        @include('admin.registerApplicant.invoiceDetailsInfo');
                    @elseif(!empty($applicantInfo->applyType) && $applicantInfo->applyType==2 )

                        @if(!empty($applicantInfo->isApprovedAuthority) && $applicantInfo->isApprovedAuthority==1)
                            <h4 class=" text-center font-weight-bold" style="color:green">আপনি বর্তমান শিক্ষার্থী
                                ক্যাটাগরিতে আবেদন করেছেন। আপনার আবেদনটি এখনও Approved করা হয় নি।
                                কর্তৃপক্ষ খুব  শ্রীঘ্রই  আপনার আবেদনটি  Approved করা হবে।</h4>
                        @elseif(!empty($applicantInfo->isApprovedAuthority) && $applicantInfo->isApprovedAuthority==2)
                            <h4 class=" text-center font-weight-bold" style="color:green">ধন্যবাদ, আবেদনটি  Approved
                                করা হয়েছে। অনুষ্ঠান সম্পর্কে খুব শ্রীঘ্রই আপডেট পাবেন। </h4>
                        @else

                        @endif

                        @include('admin.registerApplicant.invoiceDetailsInfo');
                    @else

                    @endif
                @else

                @endif
            </div>
        </div>

    </div>
</div>
