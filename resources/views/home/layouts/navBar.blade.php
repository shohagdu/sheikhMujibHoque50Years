<div class="container-fluid nav-bar p-0">
    <div class="container-lg p-0">
        <nav class="navbar navbar-expand-lg bg-secondary navbar-dark">
            <a href="{{ url('/home')}}" class="navbar-brand">
                <img src="{{ url('backend/images/logo/logo.png') }}"
                     style="height:60px">
            </a>
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                <div class="navbar-nav ml-auto py-0">
                    <a href="{{ url('/home')}}" class="nav-item nav-link active">হোম</a>
                    <a href="{{ url('/donationProcess')}}" class="nav-item nav-link">রেজিস্ট্রেশন প্রক্রিয়া</a>
                    <a href="{{ url('/events')}}" class="nav-item nav-link">ইভেন্ট সম্পর্কে</a>
                    <a href="{{ url('/aboutUs')}}" class="nav-item nav-link">আমাদের সম্পর্কে</a>
                    <a href="{{ url('/subCommittee')}}" class="nav-item nav-link">উপকমিটি সমূহ</a>
                    <a href="{{ url('/contactUs')}}" class="nav-item nav-link">হেল্প ডেস্ক</a>
                    <a href="{{ url('/admin')}}" class="nav-item nav-link">লগ ইন</a>
                </div>
            </div>
        </nav>
    </div>
</div>
