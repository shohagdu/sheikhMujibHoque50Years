@php
    $i                              = 1;
    $totalAmountCordinator          = 0;
    $totalAmount                    = 0;
    $pendingAmount                  = 0;
    $totalApprovedParticipatent     = 0;

    $iBatch                = 1;
    $totalAmountBatch      = 0;
    $totalparticipate      = 0;

    $iDate                  = 1;
    $totalAmountDate        = 0;
    $iBestBatch             = 1;

    $iExpense               = 1;
    $totalExpenseAmount     = 0;
@endphp
<div class="row">
    <div class="col-lg-3 col-6">
        <div class="small-box bg-info">
            <div class="inner">
                <h3>{{ (!empty($receivedAmnt)?$receivedAmnt:'0.00') }}</h3>
                <p>Total Received Amount</p>
            </div>
            <div class="icon">
                <i class="ion ion-bag"></i>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-6">
        <div class="small-box bg-success">
            <div class="inner">
                <h3>{{ (!empty($bankDepositedAmnt)?$bankDepositedAmnt:'0.00') }}</h3>
                <p>Bank Deposited Amount</p>
            </div>
            <div class="icon">
                <i class="ion ion-stats-bars"></i>
            </div>
        </div>
    </div>
    <div class="clearfix"></div> <br/>
</div>
<div class="card">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fas fa-chart-pie mr-1"></i>
            Total Collection Overview
        </h3>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                <i class="fas fa-times"></i>
            </button>
        </div>
    </div>
    <div class="card-body">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>S/N</th>
                <th>Category</th>
                <th class="text-center">Participator</th>
                <th class="text-right">Received Amount</th>
            </tr>
            </thead>
            <tbody>

            @if(!empty($coOrdinatorWiseCurrentApprovdAmnt))
                @foreach($coOrdinatorWiseCurrentApprovdAmnt as $coOrdinatorInfo)
                    @php($totalAmountCordinator+=$coOrdinatorInfo->ApprovedAmnt)
                    @php($pendingAmount+=$coOrdinatorInfo->pendingAmnt)
                    <tr>
                        <td>{{ $i++ }}</td>
                        <td>{{ (!empty($coOrdinatorInfo->userName)?$coOrdinatorInfo->userName:'')
                                                }}</td>
                        <td class="text-center">{{ (!empty($coOrdinatorInfo->mobileBankBkash)
                                                ?$coOrdinatorInfo->mobileBankBkash:'-')
                                                }}</td>
                        <th  class="text-right">{{ (!empty($coOrdinatorInfo->ApprovedAmnt)
                                                ?number_format($coOrdinatorInfo->ApprovedAmnt,2):'0.00')
                                                }}</th>

                    </tr>
                @endforeach
            @endif
            </tbody>
            <tfoot>
                <tr>
                    <th class="text-center" colspan="3">Total Collection Amount</th>
                    <th class="text-right" >{{ (!empty($totalAmountCordinator)?number_format($totalAmountCordinator,2):'0.00') }}</th>

                </tr>
            </tfoot>
        </table>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-chart-pie mr-1"></i>
                    Batch Wise Collection Overview
                </h3>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                        <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 10%">S/N</th>
                        <th>Batch</th>
                        <th>Total Participator </th>
                        <th class="text-right">Received</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if(!empty($batchWise))
                        @foreach($batchWise as $batch)
                            @php($totalAmount += $batch->ApprovedAmnt)
                            @php($totalApprovedParticipatent += $batch->ApprovedParticipatent)
                            <tr>
                                <td>{{ $iBatch++ }}</td>
                                <td>{{ (!empty($batch->sscBatch)?$batch->sscBatch:'')
                                                    }}</td>
                                <td class="text-center">{{ (!empty($batch->ApprovedParticipatent)
                                                ?$batch->ApprovedParticipatent:'')
                                                    }}</td>

                                <th  class="text-right">{{ (!empty($batch->ApprovedAmnt)
                                                    ?number_format($batch->ApprovedAmnt,2):'0.00')
                                                    }}</th>

                            </tr>
                        @endforeach
                    @endif
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center" colspan="2">Total  Amount</th>
                        <th class="text-center" >{{ (!empty($totalApprovedParticipatent)
                                        ?$totalApprovedParticipatent:'0
                                            ') }}</th>
                        <th class="text-right" >{{ (!empty($totalAmount)?number_format($totalAmount,2):'0
                                            .00') }}</th>

                    </tr>
                    </tfoot>

                </table>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-chart-pie mr-1"></i>
                   Best Batch Wise Collection Overview
                </h3>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                        <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 10%">S/N</th>
                        <th>Batch</th>
                        <th>Total Participator </th>
                        <th class="text-right">Received</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if(!empty($batchWise))
                        @foreach($batchWise as $batch)
                            @php($totalAmount += $batch->ApprovedAmnt)
                            @php($totalApprovedParticipatent += $batch->ApprovedParticipatent)
                            <tr>
                                <td>{{ $iDate++ }}</td>
                                <td>{{ (!empty($batch->sscBatch)?$batch->sscBatch:'')
                                                    }}</td>
                                <td class="text-center">{{ (!empty($batch->ApprovedParticipatent)
                                                ?$batch->ApprovedParticipatent:'')
                                                    }}</td>

                                <th  class="text-right">{{ (!empty($batch->ApprovedAmnt)
                                                    ?number_format($batch->ApprovedAmnt,2):'0.00')
                                                    }}</th>

                            </tr>
                        @endforeach
                    @endif
                    </tbody>
                    <tfoot>
                        <tr>
                            <th class="text-center" colspan="2">Total  Amount</th>
                            <th class="text-center" >{{ (!empty($totalApprovedParticipatent)
                                            ?$totalApprovedParticipatent:'0
                                                ') }}</th>
                            <th class="text-right" >{{ (!empty($totalAmount)?number_format($totalAmount,2):'0
                                                .00') }}</th>

                        </tr>
                    </tfoot>

                </table>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="col-sm-6">
        <div class="card pull-right">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-chart-pie mr-1"></i>
                    Date Wise Collection Overview
                </h3>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                        <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 10%">S/N</th>
                        <th>Date</th>
                        <th class="text-right">Received</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if(!empty($dateWise))
                        @foreach($dateWise as $dateCol)
                            @php($totalAmountDate += $dateCol->ApprovedAmnt)
                            <tr>
                                <td>{{ $iDate++ }}</td>
                                <td>{{ (!empty($dateCol->formatted_created_at)?$dateCol->formatted_created_at:'')
                                                    }}</td>
                                <th  class="text-right">{{ (!empty($dateCol->ApprovedAmnt)
                                                    ?number_format($dateCol->ApprovedAmnt,2):'0.00')
                                                    }}</th>

                            </tr>
                        @endforeach
                    @endif
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center" colspan="2">Total  Amount</th>
                        <th class="text-right" >{{ (!empty($totalAmountDate)?number_format($totalAmountDate,2):'0
                                            .00') }}</th>
                    </tr>
                    </tfoot>

                </table>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fas fa-chart-pie mr-1"></i>
                    Total Expense Overview
                </h3>
                <div class="card-tools">
                    <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                        <i class="fas fa-minus"></i>
                    </button>
                    <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                        <i class="fas fa-times"></i>
                    </button>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: 10%">S/N</th>
                        <th>Expense Category</th>
                        <th class="text-right">Expense Amount</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if(!empty($expenseInfo))
                        @foreach($expenseInfo as $expense)
                            @php($totalExpenseAmount += $expense->expenseAmount)

                            <tr>
                                <td>{{ $iExpense++ }}</td>
                                <td>{{ (!empty($expense->title)?$expense->title:'')
                                                    }}</td>
                                <th  class="text-right">{{ (!empty($expense->expenseAmount)
                                                    ?number_format($expense->expenseAmount,2):'0.00')
                                                    }}</th>

                            </tr>
                        @endforeach
                    @endif
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center" colspan="2">Total Expense Amount</th>
                        <th class="text-right" >{{ (!empty($totalExpenseAmount)?number_format($totalExpenseAmount,2):'0
                                            .00') }}</th>

                    </tr>
                    </tfoot>

                </table>
            </div>
        </div>
    </div>
</div>
