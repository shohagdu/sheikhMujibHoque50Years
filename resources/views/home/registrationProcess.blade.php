@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; " xmlns="http://www.w3.org/1999/html">
    </div>
    <div class="container py-5 listItem">
        <h3 class="mt-2 mb-4"> <?php echo (!empty($data['title'])?$data['title']:'') ?> </h3>
        <h5> রেজিস্ট্রেশন প্রক্রিয়া তিনটি ধাপে সম্পন্ন হবে</h5>
        <ul class="">
            <li>১। রেজিস্ট্রেশন।  <a href="{{ url('/signUp') }}"   target="_blank">লিংক</a> </li>
            <li>২। মোবাইল নম্বর ও পাসওয়ার্ড দিয়ে লগইন  করতে হবে। <a href="{{ url('/admin') }}" target="_blank">লিংক</a>
            </li>
            <li>৩। লগইন করার পর <span style="color:blue"> Confirm Registration এবং  রেজিস্ট্রেশন ফি প্রদান</span> এর  মাধ্যমে  রেজিস্ট্রেশন   প্রক্রিয়া  সম্পন্ন করা</li>
        </ul>
        <div class="col-sm-8 text-center" style="margin-top: 50px"> <h4>---গাইডলাইন---</h4> </div>
        <div class="col-sm-8">
            <ul>
                <li>
                   <h5 class="guideline"> ১। প্রথমে রেজিস্ট্রেশন অপশনে ক্লিক করে রেজিস্ট্রেশন করতে হবে।
                    রেজিস্ট্রেশন ফর্ম নিচে দেওয়া হল-</h5>
                    <img src="{{ asset('public/web/documents/register.png') }}" class="img-thumbnail" style="width: 100%">
                </li>
                <li>
                    <h5 class="guideline"> ২। রেজিস্ট্রেশন সম্পন্ন হওয়ার পর লগইন পেইজ থেকে লগইন  করতে হবে।</h5>

                    লগইন ফর্ম নিচে দেওয়া হল-
                    <img src="{{ asset('public/web/documents/login.png') }}" class="img-thumbnail" style="width: 100%">
                </li>
                <li>
                    <h5 class="guideline">৩. Confirm Registration এবং  রেজিস্ট্রেশন ফি প্রদান</span> এর  মাধ্যমে  রেজিস্ট্রেশন   প্রক্রিয়া
                        সম্পন্ন করা। এখানে তিনটি ধাপে পুরো প্রসেস সম্পন্ন করতে হবে। </h5>
                    <br/>
                    <h6>i) লগইন সম্পন্ন হওয়ার পর ড্যাশবোর্ড থেকে Confirm registration বাটনে ক্লিক করতে হবে।</h6>
                    <img src="{{ asset('public/web/documents/deshobard.png') }}" class="img-thumbnail" style="width:
                    100%">
                    <br/>   <br/>
                    <h6>ii) রেজিস্ট্রেশন সম্পর্কিত কিছু তথ্য দিতে দিয়ে Submit বাটনে ক্লিক করতে হবে।</h6>
                    <img src="{{ asset('public/web/documents/dashboard2.png') }}" class="img-thumbnail" style="width:
                    100%">
                    <br/>   <br/>
                    <h6>iii) Submit বাটনে ক্লিক করার পর আপনার প্রদানকৃত তথ্য সমূহ আবার যাচাই করার পর Pay Now বাটনে ক্লিক
                        করে
                        পেমেন্ট গেটওয়ের মাধ্যমে অনলাইনে টাকা প্রদান করতে হবে</h6>
                    <img src="{{ asset('public/web/documents/dashboard3.png') }}" class="img-thumbnail" style="width:
                    100%">
                    <br/>   <br/>
                    <h6>iv) Pay Now বাটনে ক্লিক করে আপনার CARDS, MOBILE BANKING, NET BANKING এর মাধ্যমে টাকা প্রদান করতে
                        পারবেন।</h6>
                    <img src="{{ asset('public/web/documents/dashboard4.png') }}" class="img-thumbnail" style="width:
                    100%">



                </li>

            </ul>
        </div>

    </div>
    <style>
        .listItem ul li{
            font-size: 16px;
            padding: 3px 0px;
            list-style-type: none;
        }
    </style>
@endsection
