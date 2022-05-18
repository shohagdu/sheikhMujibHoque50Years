@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5">
        <div class="row">
            <div class="col-md-3"></div>
            <div class=" col-md-6" >
                <div class="card">
                    <div class="card-header">{{ __('লগ ইন করুন') }}</div>

                    <div class="card-body">
                        <p class="login-box-msg">Sign in to start your session</p>
                        <form method="POST" action="{{ route('login') }}">
                            @csrf
                            <div class="input-group mb-3">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') ?? '' }}" placeholder="Email" required autocomplete="email" autofocus>
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-envelope"></span>
                                    </div>
                                </div>
                                @error('email')
                                <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                                @enderror
                            </div>
                            <div class="input-group mb-3">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Password" required autocomplete="current-password" value="">
                                <div class="input-group-append">
                                    <div class="input-group-text">
                                        <span class="fas fa-lock"></span>
                                    </div>
                                </div>
                                @error('password')
                                <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                                @enderror
                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <button type="submit" class="btn btn-info btn-block">Sign In</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">{{ __('হেল্প লাইন') }}</div>

                <div class="card-body">
                    <h4>৫০ বছর পূর্তি উদযাপন ২০২২</h4>
                    <h5>শেখ মুজিবল হক উচ্চ বিদ্যালয়</h5>
                    <h6>মজুমদারহাট, পো: ধর্মপুর, ফেনী সদর, ফেনী। </h6>
                    <p ><i class="fas fa-phone"></i>&nbsp; <a href="tel:01*** ******">০১৮*** *******</a></p>


                </div>
            </div>
        </div>
        -->
    </div>
@endsection



