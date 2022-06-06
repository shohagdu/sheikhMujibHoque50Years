@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5 listItem">
        <h3 class="mt-2 mb-4"> <?php echo (!empty($data['title'])?$data['title']:'') ?> </h3>
        <h5> রেজিস্ট্রেশন প্রক্রিয়া তিনটি ধাপে সম্পন্ন হবে</h5>
        <ul class="">
            <li>১। রেজিস্ট্রেশন।  <a href="{{ url('/signUp') }}"   target="_blank">লিংক</a> <br/> <small>
                নিম্নোক্ত তথ্য
                গুলো দিয়ে প্রাথমিক রেজিস্ট্রেশন করতে হবে।</small>
                <ul>
                    <li>i. নাম (Name) [required]</li>
                    <li>ii. এস.এস.সি'র ব্যাচ (SSC Batch) [required]</li>
                    <li>iii. মোবাইল নম্বর (Mobile Numbers) [required]</li>
                    <li>iv. ইমেইল এড্রেস (Email address) [optional]</li>
                    <li>v. পাসওয়ার্ড (Password) [required]</li>
                </ul>
            </li>
            <li>২। মোবাইল নম্বর ও পাসওয়ার্ড দিয়ে লগইন  করতে হবে। <a href="{{ url('/admin') }}" target="_blank">লিংক</a>
            </li>
            <li>৩। লগইন করার পর ড্যাশবোর্ডে <span style="color:blue;font-weight: bold;"> Confirm Registration
                </span>বাটনে করে
                রেজিস্ট্রেশন
                সম্পর্কিত আরও কিছু তথ্য দেওয়ার পর<span style="color:blue;font-weight: bold;"> Submit</span> বাটনে ক্লিক
                    করার পর পেমেন্ট গেটওয়ের মাধ্যমে টাকা প্রদানের
                মাধ্যমে রেজিস্ট্রেশন প্রক্রিয়া সম্পন্ন করতে হবে।
               </li>
        </ul>


    </div>
    <style>
        .listItem ul li{
            font-size: 18px;
            padding: 10px 0px;
            list-style-type: none;
        }
    </style>
@endsection
