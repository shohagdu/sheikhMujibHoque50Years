@extends('home.main')
@section('title',' ৫০ বছর পূর্তি উদযাপন ২০২২ | শেখ মুজিবল হক উচ্চ
বিদ্যালয়')
@section('main_content')
    <div class="container-fluid " style="margin-top: 85px; ">
    </div>
    <div class="container py-5">
        <h3 class="mt-2 mb-4"> <?php echo (!empty($data['title'])?$data['title']:'') ?> </h3>
        <p class="mb-4 text-justify" style="line-height: 35px;font-size: 18px">
            <?php echo (!empty($data['info'])?$data['info']:'') ?>
        </p>
    </div>
@endsection
