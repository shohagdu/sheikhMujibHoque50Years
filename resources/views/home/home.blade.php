@extends('home.main')
@section('title', 'About us | Alliance Footwear Ltd.')
@section('main_content')
    <!-- Page Header Start -->
    <div class="container-fluid page-header d-flex flex-column align-items-center justify-content-center pt-0 pt-lg-5 mb-5" style="background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url({{ asset('public/web/img/header.jpg')}});">
    </div>
    <!-- Page Header Start -->
    <!-- About Start -->
    <div class="container-fluid py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-8  mt-lg-0">
                    <p class="mb-4 text-justify"> The company Alliance Leather Goods & Footwear Ltd. began its journey on 2012 using the European origin machinery and technical knowhow. A widely spaced factory complying with up to date international specification. High standards of management and corporate strategy in addition to local expatriate qualified technicians make production and development all within fingertip and in-house. Which reflects on achievements of the annual turnover of $36 Million on the year 2017-18. Ideally located within easy accessibility of transportation and all infrastructure and only an hour away from the airport and out of the city’s bustling crowd. The company has heavy duty backup generator and world class industrial systems. International grade automated warehousing system has make the factory highly sophisticated. Alliance Leather Goods & Footwear Ltd. is 100% environment friendly footwear manufacturing company.

                    </p><br>

                    <h2 class="mt-2 mb-4"> MESSAGE FROM HONORABLE MANAGING DIRECTOR  </h2>
                    <p class="mb-4 text-justify"> On behalf of the Board of Directors of Alliance Leather Goods and Footwear Ltd, I would like to convey my gratitude to all valued customers, friends, and well-wishers. In a rapidly changing market place where expectations are increasing by the day, working closely with customers and channel partners is the key motto of our company. Our main vision is to understand customer needs and offer them the best quality products to meet constantly changing customer requirement. We thrive to provide our customers the kind of performance and productivity that will enable our customers to realize the full value of money paid. Our relationship with the Customers does not end with a sale but a journey just starts with it. Finally looking ahead, we will forge even closer relationships to our customers and partners to master with them the challenges and opportunities, which lie ahead. </p>
                    <b> Md. Salimuzzaman Joel</b>
                    <p>Managing Director<br>
                        Alliance Leather Goods and Footwear Ltd.</p>
                </div>
                <div class="col-lg-4 mt-lg-0">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12" style="margin-top:20px;
                        text-align:center;padding-bottom:20px;">
                                <h1 data-qa="title"><small data-qa="subtitle" class="clearfix pt-5 mt-10 d-none d-md-block">Not registered yet? Please <br class="d-none d-sm-inline"></small></h1>
                                <a style="margin-left:20px;" class="btn btn-success " href="{{ url('/signUp') }}"
                                >Sign Up </a>
                            </div>

                            <div  style="margin-top:70px !important;text-align:center;">
                                <h1><small data-qa="subtitle" >Already
                                        registered ? Please</small></h1>
                                <a style="margin-left:20px;" class="btn btn-primary " target="_blank" href="{{ url
                                ('/admin') }}"
                                >Login </a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- About End -->
@endsection
