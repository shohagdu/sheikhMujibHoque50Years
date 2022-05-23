<?php

namespace App\Http\Controllers;

use App\Models\InvoiceInfosModel;
use DB;
use Illuminate\Http\Request;
use App\Library\SslCommerz\SslCommerzNotification;
use Auth;

class SslCommerzPaymentController extends Controller
{

    public function exampleEasyCheckout()
    {
        return view('paymentGetWay/exampleEasycheckout');
    }

    public function exampleHostedCheckout()
    {
        return view('paymentGetWay/exampleHosted');
    }

    public function index(Request $request)
    {
        # Here you have to receive all the order data to initate the payment.
        # Let's say, your oder transaction informations are saving in a table called "orders"
        # In "orders" table, order unique identity is "transaction_id". "status" field contain status of the transaction, "amount" is the order amount to be paid and "currency" is for storing Site Currency which will be checked with paid currency.

        $post_data = array();
        $post_data['total_amount'] = '10'; # You cant not pay less than 10
        $post_data['currency'] = "BDT";
        $post_data['tran_id'] = uniqid(); // tran_id must be unique

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = 'Customer Name';
        $post_data['cus_email'] = 'customer@mail.com';
        $post_data['cus_add1'] = 'Customer Address';
        $post_data['cus_add2'] = "";
        $post_data['cus_city'] = "";
        $post_data['cus_state'] = "";
        $post_data['cus_postcode'] = "";
        $post_data['cus_country'] = "Bangladesh";
        $post_data['cus_phone'] = '8801XXXXXXXXX';
        $post_data['cus_fax'] = "";

        # SHIPMENT INFORMATION
        $post_data['ship_name'] = "Store Test";
        $post_data['ship_add1'] = "Dhaka";
        $post_data['ship_add2'] = "Dhaka";
        $post_data['ship_city'] = "Dhaka";
        $post_data['ship_state'] = "Dhaka";
        $post_data['ship_postcode'] = "1000";
        $post_data['ship_phone'] = "";
        $post_data['ship_country'] = "Bangladesh";

        $post_data['shipping_method'] = "NO";
        $post_data['product_name'] = "Computer";
        $post_data['product_category'] = "Goods";
        $post_data['product_profile'] = "physical-goods";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = "ref001";
        $post_data['value_b'] = "ref002";
        $post_data['value_c'] = "ref003";
        $post_data['value_d'] = "ref004";

        #Before  going to initiate the payment order status need to insert or update as Pending.
        $update_product = DB::table('orders')
            ->where('transaction_id', $post_data['tran_id'])
            ->updateOrInsert([
                'name' => $post_data['cus_name'],
                'email' => $post_data['cus_email'],
                'phone' => $post_data['cus_phone'],
                'amount' => $post_data['total_amount'],
                'status' => 'Pending',
                'address' => $post_data['cus_add1'],
                'transaction_id' => $post_data['tran_id'],
                'currency' => $post_data['currency']
            ]);

        $sslc = new SslCommerzNotification();
        # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
        $payment_options = $sslc->makePayment($post_data, 'hosted');

        if (!is_array($payment_options)) {
            print_r($payment_options);
            $payment_options = array();
        }

    }

    public function payViaAjax(Request $request)
    {

        # Here you have to receive all the order data to initate the payment.
        # Lets your oder trnsaction informations are saving in a table called "orders"
        # In orders table order uniq identity is "transaction_id","status" field contain status of the transaction, "amount" is the order amount to be paid and "currency" is for storing Site Currency which will be checked with paid currency.
        $post_data = array();
        $cart_json          = (!empty($request->cart_json)?json_decode($request->cart_json,true):'');

        $invoiceRecord    = InvoiceInfosModel::InvoiceWithAppInfo(['invoice_infos.id'=>$cart_json['paymentID'],'invoice_infos.isActive'=>1,'invoice_infos.transId'=>$cart_json['transId'],'invoice_infos.invoiceId'=>$cart_json['invoiceId'],'invoice_infos.netAmount'=>$cart_json['amount']]);

        if(empty($invoiceRecord->netAmount) || $invoiceRecord->netAmount<0){
            return false;
        }

       // dd($invoiceRecord);
        $post_data['total_amount']  = (!empty($invoiceRecord->netAmount)?$invoiceRecord->netAmount:'0.00');
        $post_data['currency']      = "BDT";
        $post_data['tran_id']       = (!empty($invoiceRecord->transId)?$invoiceRecord->transId:'');

        # CUSTOMER INFORMATION
        $post_data['cus_name']      = (!empty($invoiceRecord->name)?$invoiceRecord->name:'');
        $post_data['cus_email']     = (!empty($invoiceRecord->emailAddress)?$invoiceRecord->emailAddress:'');
        $post_data['cus_add1']      = (!empty($invoiceRecord->address)?$invoiceRecord->address:'');
        $post_data['cus_add2']      = "Mojumdarhat";
        $post_data['cus_city']      = "Feni Sadar";
        $post_data['cus_state']     = "Feni";
        $post_data['cus_postcode']  = "3900";
        $post_data['cus_country']   = "Bangladesh";
        $post_data['cus_phone']     = (!empty($invoiceRecord->mobileNumber)?$invoiceRecord->mobileNumber:'');
        $post_data['cus_fax']       = "";

        # SHIPMENT INFORMATION
        $post_data['ship_name']         = "50 Year Celebration of SMHHS in Feni";
        $post_data['ship_add1']         = "Mojumdarhat";
        $post_data['ship_add2']         = "Feni Sader";
        $post_data['ship_city']         = "Feni";
        $post_data['ship_state']        = "Feni";
        $post_data['ship_postcode']     = "3900";
        $post_data['ship_phone']        = "";
        $post_data['ship_country']      = "Bangladesh";

        $post_data['shipping_method']   = "NO";
        $post_data['product_name']      = "50 Year Celebration";
        $post_data['product_category']  = "Goods";
        $post_data['product_profile']   = "physical-goods";

        # OPTIONAL PARAMETERS
        $post_data['value_a'] = (!empty($invoiceRecord->invoiceId)?$invoiceRecord->invoiceId:'');
        $post_data['value_b'] = "ref002";
        $post_data['value_c'] = "ref003";
        $post_data['value_d'] = "ref004";

        $sslc = new SslCommerzNotification();
        $payment_options = $sslc->makePayment($post_data, 'checkout', 'json');
        if (!is_array($payment_options)) {
            print_r($payment_options);
            $payment_options = array();
        }

    }

    public function success(Request $request)
    {
        echo "Transaction is Successful";
        $response       = (!empty($request->all())?$request->all():'');
        $tran_id        = (!empty($response['tran_id'])?$response['tran_id']:'');
        $amount         = (!empty($response['amount'])?$response['amount']:'');
        $currency       = (!empty($response['currency'])?$response['currency']:'');
        $invoiceID      = (!empty($response['value_a'])?$response['value_a']:'');



        $invData['store_amount']   = (!empty($response['store_amount'])?$response['store_amount']:'') ;
        $invData['val_id']         = (!empty($response['val_id'])?$response['val_id']:'');
        $invData['bank_tran_id']   = (!empty($response['bank_tran_id'])?$response['bank_tran_id']:'') ;
        $invData['card_brand']     = (!empty($response['card_brand'])?$response['card_brand']:'');
        $invData['card_issuer']    = (!empty($response['card_issuer'])?$response['card_issuer']:'');
        $invData['tran_date']      = (!empty($response['tran_date'])?$response['tran_date']:'');

        $invData['paid_date']               = date('Y-m-d H:i:s');
        $invData['paymentConfrimResponse']  = (!empty($response)?json_encode($response):'');
        $invData['updated_at']              = date('Y-m-d H:i:s');
        $invData['updated_by']              = Auth::id();
        $invData['updated_ip']              = $request->ip();

        $invoiceRecord  = InvoiceInfosModel::InvoiceWithAppInfo(['invoice_infos.transId'=>$tran_id,'invoice_infos.invoiceId'=>$invoiceID,'invoice_infos.netAmount'=>$amount]);

        $sslc = new SslCommerzNotification();
        #Check order status in order table against the transaction id or order id.
        $where=[
                'invoice_infos.id'              =>$invoiceRecord->invoiceIDs,
                'invoice_infos.transId'         =>$invoiceRecord->transId,
                'invoice_infos.invoiceId'       =>$invoiceRecord->invoiceId,
                'invoice_infos.netAmount'       =>$invoiceRecord->netAmount
            ];
        if (!empty($invoiceRecord) && $invoiceRecord->paidStatus == 1) { // Pending
            $validation = $sslc->orderValidate($request->all(), $tran_id, $amount, $currency);
            if ($validation == TRUE) {
                /*
                That means IPN did not work or IPN URL was not set in your merchant panel. Here you need to update order status
                in order table as Processing or Complete.
                Here you can also sent sms or email for successfull transaction to customer
                */
                $invData['paidStatus']     = 2;

                 DB::table('invoice_infos')
                    ->where($where)
                    ->update($invData);

                echo "<br >Transaction is successfully Completed";
            } else {
                /*
                That means IPN did not work or IPN URL was not set in your merchant panel and Transation validation failed.
                Here you need to update order status as Failed in order table.
                */
                $invData['paidStatus']     = 3;

                DB::table('invoice_infos')
                ->where($where)
                ->update($invData);
                echo "validation Fail";
            }
        } else if (!empty($invoiceRecord) && $invoiceRecord->paidStatus == 2) { //Processing or Complete this payment
            /*
             That means through IPN Order status already updated. Now you can just show the customer that transaction is completed. No need to udate database.
             */
            echo "Transaction is successfully Completed s";
        } else {
            #That means something wrong happened. You can redirect customer to your product page.
            echo "Invalid Transaction";
        }
       // return redirect('admin/dashboard');


    }

    public function fail(Request $request)
    {
       // dd($request->all());
       // $tran_id = $request->input('tran_id');
        $response       = (!empty($request->all())?$request->all():'');
        $tran_id        = (!empty($response['tran_id'])?$response['tran_id']:'');
        $amount         = (!empty($response['amount'])?$response['amount']:'');
        $invoiceID      = (!empty($response['value_a'])?$response['value_a']:'');
        $status         = (!empty($response['status'])?$response['status']:'');




        $invData['val_id']                  = (!empty($response['val_id'])?$response['val_id']:'');
        $invData['bank_tran_id']            = (!empty($response['bank_tran_id'])?$response['bank_tran_id']:'') ;
        $invData['card_brand']              = (!empty($response['card_brand'])?$response['card_brand']:'');
        $invData['card_issuer']             = (!empty($response['card_issuer'])?$response['card_issuer']:'');
        $invData['paymentConfrimResponse']  = (!empty($response)?json_encode($response):'');
        $invData['updated_at']              = date('Y-m-d H:i:s');
        $invData['updated_by']              = Auth::id();
        $invData['updated_ip']              = $request->ip();

        $invoiceRecord  = InvoiceInfosModel::InvoiceWithAppInfo(['invoice_infos.transId'=>$tran_id,'invoice_infos.invoiceId'=>$invoiceID,'invoice_infos.netAmount'=>$amount]);

        $where=[
            'invoice_infos.id'              => $invoiceRecord->invoiceIDs,
            'invoice_infos.transId'         => $invoiceRecord->transId,
            'invoice_infos.invoiceId'       => $invoiceRecord->invoiceId,
            'invoice_infos.netAmount'       => $invoiceRecord->netAmount
        ];
        if (!empty($invoiceRecord) && $invoiceRecord->paidStatus == 1 && $status=='FAILED') {
            $invData['paidStatus']     = 3;

            DB::table('invoice_infos')
                ->where($where)
                ->update($invData);
            echo "Transaction is Failed";
        } else if (!empty($invoiceRecord) && $invoiceRecord->paidStatus == 2 && $status!='FAILED') {
            echo "Transaction is already Successful";
        } else {
            echo "Transaction is Invalid";
        }
        return redirect('admin/dashboard');

    }

    public function cancel(Request $request)
    {
        $tran_id = $request->input('tran_id');

        $order_detials = DB::table('orders')
            ->where('transaction_id', $tran_id)
            ->select('transaction_id', 'status', 'currency', 'amount')->first();

        if ($order_detials->status == 'Pending') {
            $update_product = DB::table('orders')
                ->where('transaction_id', $tran_id)
                ->update(['status' => 'Canceled']);
            echo "Transaction is Cancel";
        } else if ($order_detials->status == 'Processing' || $order_detials->status == 'Complete') {
            echo "Transaction is already Successful";
        } else {
            echo "Transaction is Invalid";
        }


    }

    public function ipn(Request $request)
    {
        #Received all the payement information from the gateway
        if ($request->input('tran_id')) #Check transation id is posted or not.
        {

            $tran_id = $request->input('tran_id');

            #Check order status in order tabel against the transaction id or order id.
            $order_details = DB::table('orders')
                ->where('transaction_id', $tran_id)
                ->select('transaction_id', 'status', 'currency', 'amount')->first();

            if ($order_details->status == 'Pending') {
                $sslc = new SslCommerzNotification();
                $validation = $sslc->orderValidate($request->all(), $tran_id, $order_details->amount, $order_details->currency);
                if ($validation == TRUE) {
                    /*
                    That means IPN worked. Here you need to update order status
                    in order table as Processing or Complete.
                    Here you can also sent sms or email for successful transaction to customer
                    */
                    $update_product = DB::table('orders')
                        ->where('transaction_id', $tran_id)
                        ->update(['status' => 'Processing']);

                    echo "Transaction is successfully Completed";
                } else {
                    /*
                    That means IPN worked, but Transation validation failed.
                    Here you need to update order status as Failed in order table.
                    */
                    $update_product = DB::table('orders')
                        ->where('transaction_id', $tran_id)
                        ->update(['status' => 'Failed']);

                    echo "validation Fail";
                }

            } else if ($order_details->status == 'Processing' || $order_details->status == 'Complete') {

                #That means Order status already updated. No need to udate database.

                echo "Transaction is already successfully Completed";
            } else {
                #That means something wrong happened. You can redirect customer to your product page.

                echo "Invalid Transaction";
            }
        } else {
            echo "Invalid Data";
        }
    }

}
