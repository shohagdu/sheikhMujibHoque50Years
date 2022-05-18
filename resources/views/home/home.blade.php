@extends('home.main')
@section('title', 'হোম | ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ বিদ্যালয়')
@section('main_content')
    <!-- Page Header Start -->
    <div class="container-fluid page-header d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5
     mb-5" style="background-image:url({{ asset('public/web/img/header.jpg')}});
        background-repeat:no-repeat;
        margin-top: 85px;
        background-size: 100%;
        ">
    </div>
    <!-- Page Header Start -->
    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8  mt-lg-0">
                    <p class="mb-4 text-justify">
                       খুব শ্রীঘ্রই তথ্য আপডেট করা হবে।
                    </p><br>

                    <h4 class="mt-2 mb-4"> অনুষ্ঠানের আহ্বায়ক এর বার্তা  </h4>
                    <p class="mb-4 text-justify"> খুব শ্রীঘ্রই তথ্য আপডেট করা হবে।  </p>
                    <b> জনাব ......</b>
                    <p>
                        ....<br>
                        ....
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
    <!-- About End -->
@endsection
