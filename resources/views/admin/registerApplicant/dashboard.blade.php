<?php
  //  echo "<pre>";
  // print_r($userInfo->id)
?>
<div >
    <div class="card-body">
        <div class="row">
            <div class="col-md-4 text-center">
                <img src="{{ url('backend/images/avatar.jpg') }}" style="height: 200px">
            </div>
            <div class="col-md-8">
                <div class="d-flex  align-items-center border-bottom mb-3">
                    <p class="text-success text-xl">
                        <i class="ion ion-ios-refresh-empty"></i>
                    </p>
                    <p class="d-flex flex-column ">
                         <span class="font-weight-bold">
                            <i class="ion ion-android-arrow-up text-success"></i> {{ (!empty($userInfo->name)?$userInfo->name:'') }}
                        </span>
                        <span class="text-muted">Name</span>
                    </p>
                </div>
                <div class="d-flex  align-items-center border-bottom mb-3">
                    <p class="text-warning text-xl">
                        <i class="ion ion-ios-cart-outline"></i>
                    </p>
                    <p class="d-flex flex-column ">
                        <span class="font-weight-bold">
                        <i class="ion ion-android-arrow-up text-warning"></i> {{ (!empty($userInfo->email)?$userInfo->email:'') }}
                        </span>
                        <span class="text-muted">Mobile</span>
                    </p>
                </div>

                <div class="d-flex  align-items-center mb-0">
                    <p class="text-danger text-xl">
                        <i class="ion ion-ios-people-outline"></i>
                    </p>
                    <p class="d-flex flex-column ">
                        <span class="font-weight-bold">
                        <i class="ion ion-android-arrow-down text-danger"></i> {{ (!empty($userInfo->mobile)?$userInfo->mobile:'') }}
                        </span>
                        <span class="text-muted">Email </span>
                    </p>
                </div>
            </div>
            <div class="col-sm-12 text-center">
                <a href="{{ url('admin/confirmRegistration/'.$userInfo->id) }}" class="btn btn-success btn-lg
                text-center"><i class="fa  fa-angle-right"></i> Payment  Now</a>
            </div>
        </div>

    </div>
</div>
