@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5">
        <div class="row">
            <div class=" col-md-8" >
                <div class="card">
                    <div class="card-header">{{ __('রেজিস্ট্রেশন করুন') }}</div>
                    <div class="card-body">
                        <form method="POST" action="{{ route('registrationFormAction') }}">
                            @csrf
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <div class="form-group row">
                                <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('নাম') }}</label>

                                <div class="col-md-6">
                                    <input id="name" type="text" class="form-control @error('name') is-invalid
@enderror" name="name" placeholder="নাম" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                    @error('name')
                                    <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="sscBatch" class="col-md-4 col-form-label text-md-right">আপনার এস.এস.সি'র ব্যাচ</label>
                                <div class="col-md-6">
                                    <select class="form-control @error ('sscBatch') is-invalid @enderror" id="sscBatch" name="sscBatch">
                                        <option value="">এস.এস.সি'র ব্যাচ সিলেক্ট  করুন</option>
                                        @for($i=2021;$i>=1976;$i--)
                                            <option value="{{ $i }}" {{ ((!empty(old('sscBatch')) && (old('sscBatch')==$i))?"selected":'') }}>{{ $i
                                }}</option>
                                        @endfor
                                    </select>
                                    @error('sscBatch')
                                    <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="mobileNo" class="col-md-4 col-form-label text-md-right">{{ __('মোবাইল')
                                }}</label>

                                <div class="col-md-6">
                                    <input id="mobileNo" type="mobileNo" placeholder="মোবাইল" class="form-control @error('mobileNo') is-invalid
@enderror" name="mobileNo" value="{{ old('mobileNo') }}" required autocomplete="mobileNo">

                                    @error('mobileNo')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>



                            <div class="form-group row">
                                <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('ইমেইল')
                                }}</label>

                                <div class="col-md-6">
                                    <input id="email" type="email" placeholder="ইমেইল" class="form-control @error('email') is-invalid
@enderror" name="email" value="{{ old('email') }}" >

                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>


                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('পাসওয়ার্ড')
                                }}</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" placeholder="পাসওয়ার্ড" class="form-control @error('password')
                                        is-invalid @enderror" name="password" required autocomplete="new-password">

                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('পুনরায় পাসওয়ার্ড') }}</label>

                                <div class="col-md-6">
                                    <input id="password-confirm" placeholder="পুনরায় পাসওয়ার্ড" type="password"
                                           class="form-control"
                                           name="password_confirmation" required autocomplete="new-password">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label  class="col-md-4 col-form-label text-md-right"></label>
                                <div class="col-md-6">
                                    <input class="form-check-input"  required name="termsCondition"
                                           type="checkbox" {{ (!empty(old('termsCondition'))?'checked':'') }} value="1"
                                           id="termsCondition" >
                                    <label class="form-check-label" for="flexCheckDisabled">
                                        I have read and agree with website's <a href="{{ url('termsOfService') }}" target="_blank">Terms
                                            and
                                            Condition </a> ,
                                        <a href="{{ url('/privacyPolicy') }}" target="_blank">Privacy Policy</a>
                                                                                and
                                        <a href="{{ url('/refundReturns') }}" target="_blank">Refund Policy.</a>
                                    </label>
                                    @error('termsCondition')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>


                            <div class="form-group row mb-0">
                                <div class="col-md-6 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        {{ __('Register') }}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
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
        </div>
    </div>
@endsection

