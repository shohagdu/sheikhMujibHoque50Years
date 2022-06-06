@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5">
        <h2 class="mt-2 mb-4"> <?php echo (!empty($data['title'])?$data['title']:'') ?> </h2>
        <p class="mb-4 text-justify">
            <h4>Our website</h4>
            <p>
                Our website address is: <a href="https://50years-smhhs.com/"><strong>https://50years-smhhs.com/</strong></a>
            </p>
            <h4> Definitions of basic terms, rights and restriction:</h4>
            <h4>Basic terms</h4>
            <p>Content will updating...</p>
            <h4>Rights &amp; restrictions</h4>
            <ol>
                <li>Applicant Must be Student of Sheikh Mujibal Hoque High School</li>
                <li>Every Applicant  have registration fees.</li>

            </ol>
        </p>
    </div>
@endsection
