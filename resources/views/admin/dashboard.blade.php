@extends('admin.layouts.app')
@section('content')
    <section class="content">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">Dashboard</h3>
            </div>
            <div class="card-body">
                @if(1==2)
                    @include('admin/layouts/partial/donationDashboard')
                @endif
                @if(!empty($userType) && ($userType==1 || $userType==2 || $userType==3|| $userType==4 ))
                        @include('admin/layouts/partial/celebrationDashboard')
                @endif
                @if(!empty($userType) && ($userType==10 ))
                    @include('admin.registerApplicant.dashboard')
                @endif

            </div>
        </div>
    </section>
@endsection

@push('js_lib')
    <!-- bootstrap time picker -->
{{--    <script src="{{URL::asset('backend/plugins/timepicker/bootstrap-timepicker.min.js')}}"></script>--}}
    <script src="{{URL::asset('backend/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js')}}"></script>
    <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
    <script src="{{ URL::asset('backend/dist/js/pages/dashboard.js') }}"></script>
{{--    <script src="{{ URL::asset('backend/plugins/printThis/printThis.js') }}"></script>--}}
    <script src="{{ URL::asset('backend/bower_components/moment/min/moment.min.js') }}"></script>
    <script src="{{ URL::asset('backend/bower_components/bootstrap-daterangepicker/daterangepicker.js') }}"></script>

{{--    <script src="{{ URL::asset('backend/plugins/fullcalendar/fullcalendar.js') }}"></script>--}}
@endpush
<style>
    .table td{
        font-size: 14px !important;
    }
    .table th{
        font-size: 13px !important;
    }
</style>

