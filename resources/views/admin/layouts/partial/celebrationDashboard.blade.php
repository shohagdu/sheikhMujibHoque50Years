@php
    $i                              = 1;
    $totalAmountCordinator          = 0;
    $totalAmount                    = 0;
    $pendingAmount                  = 0;
    $totalApprovedParticipatent     = 0;
    $totalApplyParticipator         = 0;
    $totalPaidParticipant           = 0;
    $invoiceGeneratedParticipant    = 0;

    $iBatch                         = 1;
    $totalAmountBatch               = 0;
    $totalBatchApplyParticipator    = 0;
    $totalBatchPaidParticipant      = 0;
    $totalBatchPaidParticipant      = 0;
    $totalBatchInvoiceGeneratedParticipant      = 0;


    $totalAmountDate        = 0;
    $iBestBatch             = 1;

    $iExpense               = 1;
    $totalExpenseAmount     = 0;

    $totalPaymentReceived       = 0;
    $totalApplyParticipator     = 0;

    $bestBatchSn                            = 1;
    $totalBestBatch                         = 0;
    $totalBestBatchApplyParticipator        = 0;
    $totalBestInvoiceGeneratedParticipant   = 0;
    $totalBestPaidParticipant               = 0;

    $iDate                                  = 1;
    $totalDateParticipator                  = 0;
    $totalAmountDate                        = 0;
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
                <th class="text-center">Total Participator</th>
                <th class="text-center">Pending </th>
                <th class="text-center">Paid </th>
                <th class="text-right">Received Amount</th>
            </tr>
            </thead>
            <tbody>

            @if(!empty($receivedCtgInfo))
                @foreach($receivedCtgInfo as $recivedGetway)
                    @php($totalPaymentReceived+=$recivedGetway->paymentGetwayRecivedAmnt)
                    @php($totalApplyParticipator+=$recivedGetway->applyParticipator)
                    @php($totalPaidParticipant+=$recivedGetway->PaidParticipant)
                    @php($invoiceGeneratedParticipant+=$recivedGetway->invoiceGeneratedParticipant)
                    <tr>
                        <td>{{ $i++ }}</td>
                        <td>{{ (!empty($applicantApplyType[$recivedGetway->applyType])
                        ?$applicantApplyType[$recivedGetway->applyType]:'')
                                                }}</td>
                        <td class="text-center">{{ (!empty($recivedGetway->applyParticipator) ?$recivedGetway->applyParticipator:'-') }}</td>
                        <td class="text-center">{{ (!empty($recivedGetway->invoiceGeneratedParticipant) ?$recivedGetway->invoiceGeneratedParticipant:'-') }}</td>
                        <td class="text-center">{{ (!empty($recivedGetway->PaidParticipant) ?$recivedGetway->PaidParticipant:'-') }}</td>
                        <th  class="text-right">{{ (!empty($recivedGetway->paymentGetwayRecivedAmnt)
                                                ?number_format($recivedGetway->paymentGetwayRecivedAmnt,2):'0.00')
                                                }}</th>

                    </tr>
                @endforeach
            @endif
            </tbody>
            <tfoot>
                <tr>
                    <th class="text-center" colspan="2">Total Collection Amount (Payment getway)</th>
                    <th class="text-center" >{{ (!empty($totalApplyParticipator)?$totalApplyParticipator:'0') }}</th>
                    <th class="text-center" >{{ (!empty($invoiceGeneratedParticipant)?$invoiceGeneratedParticipant:'0') }}</th>
                    <th class="text-center" >{{ (!empty($totalPaidParticipant)?$totalPaidParticipant:'0') }}</th>

                    <th class="text-right" >{{ (!empty($totalPaymentReceived)?$totalPaymentReceived:'0.00') }}</th>


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
                        <th>Pending </th>
                        <th>Paid </th>
                        <th class="text-right">Received</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if(!empty($batchWiseReceivedAmnt))
                        @foreach($batchWiseReceivedAmnt as $batch)
                            @php($totalAmount                += $batch->paymentGetwayRecivedAmnt)
                            @php($totalBatchApplyParticipator+= $batch->applyParticipator)
                            @php($totalBatchPaidParticipant  += $batch->PaidParticipant)
                            @php($totalBatchInvoiceGeneratedParticipant  += $batch->invoiceGeneratedParticipant)
                            <tr>
                                <td>{{ $iBatch++ }}</td>
                                <td>{{ (!empty($batch->sscBatch)?$batch->sscBatch:'')
                                                    }}</td>
                                <td class="text-center">{{ (!empty($batch->applyParticipator)?$batch->applyParticipator:'') }}</td>
                                <td class="text-center">{{ (!empty($batch->invoiceGeneratedParticipant)
                                ?$batch->invoiceGeneratedParticipant:'-') }}</td>
                                <td class="text-center">{{ (!empty($batch->PaidParticipant)
                                ?$batch->PaidParticipant:'-') }}</td>


                                <th  class="text-right">{{ (!empty($batch->paymentGetwayRecivedAmnt)
                                                    ?number_format($batch->paymentGetwayRecivedAmnt,2):'0.00')
                                                    }}</th>

                            </tr>
                        @endforeach
                    @endif
                    </tbody>
                    <tfoot>
                        <tr>
                            <th class="text-center" colspan="2">Total  Amount</th>
                            <th class="text-center" >{{ (!empty($totalBatchApplyParticipator)?$totalBatchApplyParticipator:'0') }}</th>
                            <th class="text-center" >{{ (!empty($totalBatchInvoiceGeneratedParticipant)?$totalBatchInvoiceGeneratedParticipant:'0') }}</th>
                            <th class="text-center" >{{ (!empty($totalBatchPaidParticipant)?$totalBatchPaidParticipant:'0') }}</th>


                            <th class="text-right" >{{ (!empty($totalAmount)?number_format($totalAmount,2):'0.00') }}</th>

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
                        <th>Pending </th>
                        <th>Paid </th>
                        <th class="text-right">Received</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if(!empty($bestBatchWiseReceivedAmnt))
                        @foreach($bestBatchWiseReceivedAmnt as $bestBatch)
                            @php($totalBestBatch                  += $bestBatch->paymentGetwayRecivedAmnt)
                            @php($totalBestBatchApplyParticipator  += $bestBatch->applyParticipator)
                            @php($totalBestInvoiceGeneratedParticipant  += $bestBatch->invoiceGeneratedParticipant)
                            @php($totalBestPaidParticipant  += $bestBatch->PaidParticipant)
                            <tr>
                                <td>{{ $bestBatchSn++ }}</td>
                                <td>{{ (!empty($bestBatch->sscBatch)?$bestBatch->sscBatch:'')
                                                    }}</td>
                                <td class="text-center">{{ (!empty($bestBatch->applyParticipator)
                                                ?$bestBatch->applyParticipator:'')
                                                    }}</td>
                                <td class="text-center">{{ (!empty($bestBatch->invoiceGeneratedParticipant)
                                ?$bestBatch->invoiceGeneratedParticipant:'-') }}</td>
                                <td class="text-center">{{ (!empty($bestBatch->PaidParticipant)
                                ?$bestBatch->PaidParticipant:'-') }}</td>
                                <th  class="text-right">{{ (!empty($bestBatch->paymentGetwayRecivedAmnt)
                                                    ?number_format($bestBatch->paymentGetwayRecivedAmnt,2):'0.00')
                                                    }}</th>

                            </tr>
                        @endforeach
                    @endif
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center" colspan="2">Total  Amount</th>
                        <th class="text-center" >{{ (!empty($totalBestBatchApplyParticipator)?$totalBestBatchApplyParticipator:'0') }}</th>
                        <th class="text-center" >{{ (!empty($totalBestInvoiceGeneratedParticipant)?$totalBestInvoiceGeneratedParticipant:'0') }}</th>
                        <th class="text-center" >{{ (!empty($totalBestPaidParticipant)?$totalBestPaidParticipant:'0') }}</th>

                        <th class="text-right" >{{ (!empty($totalBestBatch)?number_format($totalBestBatch,2):'0.00') }}</th>

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
                        <th>Participator (Paid)</th>
                        <th class="text-right">Received</th>
                    </tr>
                    </thead>
                    <tbody>

                    @if(!empty($dateWise))
                        @foreach($dateWise as $dateCol)
                            @php($totalDateParticipator   += $dateCol->applyParticipator)
                            @php($totalAmountDate         += $dateCol->paymentGetwayRvdAmnt)
                            <tr>
                                <td>{{ $iDate++ }}</td>
                                <td>{{ (!empty($dateCol->receivedDate)?$dateCol->receivedDate:'') }}</td>
                                <td class="text-center">{{ (!empty($dateCol->applyParticipator)?$dateCol->applyParticipator:'') }}</td>
                                <th  class="text-right">{{ (!empty($dateCol->paymentGetwayRvdAmnt) ?number_format($dateCol->paymentGetwayRvdAmnt,2):'0.00')  }}</th>

                            </tr>
                        @endforeach
                    @endif
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center" colspan="2">Total  Amount</th>
                        <th class="text-center" >{{ (!empty($totalDateParticipator)?$totalDateParticipator:'0') }}</th>
                        <th class="text-right" >{{ (!empty($totalAmountDate)?number_format($totalAmountDate,2):'0.00') }}</th>
                    </tr>
                    </tfoot>

                </table>
            </div>
        </div>
    </div>
    @if(!empty($userType) && ($userType==1 || $userType==2 || $userType==3))
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
    @endif
</div>
