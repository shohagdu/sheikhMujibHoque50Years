@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5">
        <h2 class="mt-2 mb-4"> <?php echo (!empty($data['title'])?$data['title']:'') ?> </h2>
        <p class="mb-4 text-justify">
        <p>Before registration from our website, please read the following points carefully and give your consent.</p>
        <p><!-- /wp:heading --><!-- wp:paragraph --></p>
        <h4>Availability of Website</h4>
        <ol>
            <li>Member recognizes that the traffic of data through the Internet may cause delays<br />during the download of information from the website and accordingly, it shall not hold the Company liable for delays that are ordinary in the course of Internet use.</li>
            <li>Member further acknowledges and accepts that the website will not be available on a continual twenty-four hour basis due to such delays, or delays caused by the Company’s upgrading, modification, or standard maintenance of the website.</li>
        </ol>
        <h4>Intellectual Property Rights</h4>
        <ol>
            <li>The online course is owned by the Company and is protected by Bangladesh and international copyright, trademark, patent, trade secret and other intellectual property or proprietary rights laws. Action will be taken against anyone who spreads any information or course to us.</li>
            <li>No right, title or interest in or to the online course or any portion thereof, is transferred to any Member, and all rights not expressly granted herein, are reserved by the Company.</li>
        </ol>
        <h4>Governing Law and Venue</h4>
        <ol>
            <li>These Terms of Service are construed and governed by the laws of the <strong>Bangladesh</strong>.</li>
            <li>If any of the provisions, either in whole or in part, of the contract is or becomes invalid or unenforceable, this shall not serve to invalidate the remaining provisions thereof.</li>
        </ol>
        </p>
    </div>
@endsection
