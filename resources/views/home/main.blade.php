<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title> @yield('title')</title>
    <meta name="path" content="{{ url('/') }}">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="{{ asset('public/web/lib/owlcarousel/assets/owl.carousel.min.css')}}" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="{{ asset('public/web/css/style.css')}}" rel="stylesheet">
    @yield('custom_css')
    <style>
        .itemC img{
            padding-top: 40px;
            width: 100%;
            height: 250px;
        }
    </style>
</head>

<body>
<!-- Navbar Start -->
@include('home.layouts.navBar')
<!-- Navbar End -->

<!-- Content Start -->
@yield('main_content')
<!-- Content End -->

<!-- Footer Start -->
@include('home.layouts.footer')
<!-- Footer End -->

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary back-to-top"><i class="fa fa-angle-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="{{ asset('public/web/lib/easing/easing.min.js')}}"></script>
<script src="{{ asset('public/web/lib/waypoints/waypoints.min.js')}}"></script>
<script src="{{ asset('public/web/lib/counterup/counterup.min.js')}}"></script>
<script src="{{ asset('public/web/lib/owlcarousel/owl.carousel.min.js')}}"></script>

<!-- Contact Javascript File -->
<script src="{{ asset('public/web/mail/jqBootstrapValidation.min.js')}}"></script>
<script src="{{ asset('public/web/mail/contact.js')}}"></script>

<!-- Template Javascript -->
<script src="{{ asset('public/web/js/main.js')}}"></script>
@yield('script')
<script>
    $(document).ready(function() {
        $("#owl-example1").owlCarousel({
            margin:10,
            items:1,
            autoplay:true,
            autoplayTimeout:2000,
        });
        $("#regModal").modal('show');

    });

</script>
</body>

</html>
