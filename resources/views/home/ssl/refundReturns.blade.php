@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5">
        <h2 class="mt-2 mb-4"> <?php echo (!empty($data['title'])?$data['title']:'') ?> </h2>
        <p class="mb-4 text-justify">
        <h4>Some instructions for refunds</h4>
        <ul>
            <li>Registration fee will not return.</li>
            <li>We support this plan to meet the full needs of a user in order to make people prosperous and move the country forward.</li>

            <li><p>Our Team review your refund appeal. Then Within five hours If you think it is refundable, you must be refunded. In that case 75% will be deducted from you and you will get 25% refund after 10 days.</p></li>
        </ul>
            <h4>Reasons For Rejection Of &#8220;Refund Request&#8221;</h4>
        <ul>
            <li>When You have to Apply for Refund, You should be apply within 2 hours of the Registration Process
                Complete
                .</li>
            <li>Your money will be not refundable After 2 hours of registration process complete</li>
            <li>Instant refunds are not possible because we accept payments through the gateway.</li>
            <li>If you want a refund outside of our terms and conditions, we are not obliged to pay. We do not agree with your irrational logic.</li>
        </ul>

        </p>
    </div>
@endsection
