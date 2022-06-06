@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5">
        <h2 class="mt-2 mb-4"> <?php echo (!empty($data['title'])?$data['title']:'') ?> </h2>
        <p class="mb-4 text-justify" style="text-align: justify;">
        <h4>Accepted Currency (গৃহীত কারেন্সি)</h4>
        <p class="text-justify"> We mainly accept payments in <strong>Bangladeshi Taka</strong>, meanwhile other major currencies are
            possible but the total amount will vary based on the target exchange rates and tax policies of each country.&nbsp;</p>
        <h4>Registration Process (রেজিস্ট্রেশন প্রসেস)</h4>
        <p>In order to Participate of 50 Years Celebration must first register with a personal
            account providing the  following information:</p>
        <ul>
            <li>নাম (Name)  [required]</li>
            <li>এস.এস.সি'র ব্যাচ (SSC Batch) [required]</li>
            <li>মোবাইল নম্বর (Mobile Numbers) [required]</li>
            <li>ইমেইল এড্রেস (Email address) [optional]</li>
            <li>পাসওয়ার্ড (Password) [required]</li>
        </ul>

        <h4>কিভাবে অনলাইন পেমেন্ট করতে হয় (How to online Payment)</h4>
        <p class=" text-justify">
            রেজিস্ট্রেশন করার পর লগইন করার মাধ্যমে  আপনার ড্যাসবোর্ডে রেজিস্ট্রেশন এবং পেমেন্ট এর বাকী তথ্য গুলো
            দেওয়ার পর বিকাশ, নগদ, রকেট, মাস্টার কার্ড, ভিসা কার্ড এর মাধ্যমে সম্পন্ন করতে পারবেন। এক্ষেত্রে আমরা SSL
            Commerce Automation System ব্যবহার করছি।
        </p>
        <p><em>***SSL Commerce Transaction Fees   are calculated by 2.5% from Gross Amount</em></p>
        </p>
    </div>
@endsection
