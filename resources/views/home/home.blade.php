@extends('home.main')
@section('title', 'হোম | ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ বিদ্যালয়')
@section('main_content')
    <div class="container-fluid page-header d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5
     mb-5" style="background-image:url({{ asset('public/web/img/header.jpg')}});
        background-repeat:no-repeat;
        margin-top: 85px;
        background-size: 100%;
        ">
    </div>
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8  mt-lg-0">
                    <p class="mb-4 text-justify" style="line-height: 35px;font-size: 18px"> শেখ মুজিবল হক উচ্চ বিদ্যালয়
                        ফেনী সদর
                        উপজেলার একটি
                        প্রাচীনতম ও
                        ঐতিহ্যবাহী শিক্ষা প্রতিষ্ঠান,অত্র বিদ্যালয়ের ৫০ বছর পূর্তি উপলক্ষে সুবর্ণ জয়ন্তী ও প্রাক্তন ছাত্র-ছাত্রীদের পুনর্মিলনী অনুষ্ঠান চলতি বছরের ডিসেম্বরে শেষ সপ্তাহে(সম্ভাব্য)উদযাপন হতে যাচ্ছে।সুবর্ণ জয়ন্তী উদযাপন ও প্রাক্তন ছাত্র ছাত্রীদের পূর্ণমিলনী অনুষ্ঠান উপলক্ষে ম্যানুয়ালি ও অনলাইনে রেজিস্ট্রেশন কার্যক্রম চলমান আছে।
                        অত্র বিদ্যালয়ের প্রাক্তন ছাত্র-ছাত্রীদেরকে নির্ধারিত সময়ের মধ্যে রেজিস্ট্রেশন করার জন্য সবিনয় অনুরোধ জানাচ্ছি এবং একান্ত সহযোগিতা সহ অনুষ্ঠানের সফলতা কামনা করিতেছি।
                    </p>
                    <p>
                       <h5>ধন্যবাদান্তে,</h5>
                        <h6> আইয়ুব আহমদ আনসারী।</h6>
                        সম্পাদক
                        কার্যকরী কমিটি।<br/>
                        সুবর্ণজয়ন্তী উদযাপন পরিষদ।
                    </p>
                </div>
                <div class="col-lg-4 mt-lg-0">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 text-center">
                            <h2><small data-qa="subtitle" >এখনও রেজিস্ট্রেশন করেননি?</small> </h2>
                                <a style="margin-left:20px;" class="btn btn-success " href="{{ url('/signUp') }}"
                                >রেজিস্ট্রেশন </a>


                            <div  style="margin-top:70px !important;text-align:center;">
                                <h2><small data-qa="subtitle" >ইতিমধ্যে রেজিস্ট্রেশন করেছেন?</small></h2>
                                <a style="margin-left:20px;" class="btn btn-info " target="_blank" href="{{ url
                                ('/admin') }}">লগ ইন </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="modal fade" id="regModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"> সুবর্ণ জয়ন্তী ও পুনর্মিলনী অনুষ্ঠান রেজিস্ট্রেশন  </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="margin: 0px;padding: 0px;">
                    <a href="{{ url('/signUp') }}">
                        <img src="{{ asset('public/web/img/modalImg.jpg') }}" style="width: 100%;">
                    </a>
                </div>
                <div class="modal-footer">
                    <a href="{{ url('/signUp') }}" class="btn btn-info" >রেজিস্ট্রেশন</a>
                    <a href="{{ url('/admin') }}" class="btn btn-success" >লগ ইন</a>
                    <button type="button" class="btn btn-danger" data-dismiss="modal"> Close</button>

                </div>
            </div>
        </div>
    </div>
@endsection
