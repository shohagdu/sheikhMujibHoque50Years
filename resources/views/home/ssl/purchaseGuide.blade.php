@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5">
        <h4 class="mt-2 mb-4"> <?php echo (!empty($data['title'])?$data['title']:'') ?> </h4>
        <p class="mb-4 text-justify">
            <h3>Accepted Currency</h3>
        <p><!-- /wp:heading --><!-- wp:paragraph --></p>
        <p>All the prices of courses are in <strong>Bangladeshi Taka</strong>. We mainly accept payments in Bangladeshi Taka, meanwhile other major currencies are possible but the total amount will vary based on the target exchange rates and tax policies of each country.&nbsp;</p>
        <h3>Account Registering</h3>
        <p>In order to buy any course or become a member of our Academy, customers/ learners must first register with a personal account providing the following information:</p>
        <ul>
            <li>Name (required)</li>
            <li>Photo (required)</li>
            <li>Address (required)</li>
            <li>Passport/ ID no. (required)</li>
            <li>Current career (required)</li>
            <li>Mobile phone numbers (required)</li>
            <li>Email address (required)</li>
            <li>Social profiles (optional)</li>
        </ul>
        <h3>Membership Policy</h3>
        <p>Once successfully registered to be a member of our Academy, users can log in to their account at any time to enjoy and free &amp; useful lessons. When they purchase a course, their account will be credited instant. In addition, if you buy more than one course, there are discounts and installment benefits. You can check our Courses <strong><a href="https://www.pixencyacademy.com/popular-courses/">here</a>.</strong></p>
        <h3>How to Purchase a Course?&nbsp;</h3>
        <p>Click on the Buy this course button, then provide your Payment information like Bkash, Nagad&nbsp;, Rocket, Master Card to complete the purchase. We are using SSL Commerce Automation system. Do not need to save your payment information. it will automatically be filled out for you to proceed with check-out in just 1 click only.&nbsp;</p>
        <h3>Accepted Credit Cards</h3>
        <ul>
            <li>Bkash</li>
            <li>Nagad&nbsp;</li>
            <li>Rocket</li>
            <li>Master Card</li>
        </ul>
        <p><em>*Taxes are calculated by your local bank and location.</em></p>
        <h3>Why to Buy our Course?</h3>
        <ul>
            <li>Updated content on a regular basis</li>
            <li>Secure &amp; hassle-free payment</li>
            <li>1-click checkout</li>
            <li>Easy access &amp; smart user dashboard</li><li>24/7 Hours Support</li>
        </ul>
        </p>
    </div>
@endsection
