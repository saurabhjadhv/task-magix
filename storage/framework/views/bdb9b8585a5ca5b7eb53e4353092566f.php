<?php $__env->startSection('title'); ?>
    <?php echo e(__('Invoice')); ?>

<?php $__env->stopSection(); ?>
<?php $__env->startSection('title'); ?>
    <div class="d-inline-block">
        <h5 class="h4 d-inline-block font-weight-400 mb-0 "><?php echo e(__('Invoice')); ?> <?php echo e('(' . $invoice->name . ')'); ?></h5>
    </div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('css'); ?>
    <style>
        #card-element {
            border: 1px solid #e4e6fc;
            border-radius: 5px;
            padding: 10px;
        }
        .application-offset .container-application:before {
    background-color: #449fc6 !important;
}
    </style>
<?php $__env->stopPush(); ?>
<?php
    if(isset($invoice))
    {
        $payment_detail = Utility::getCompanyPaymentSetting($invoice->created_by);
    }
    elseif(\Auth::check())
    {
        $payment_detail = Utility::getCompanyPaymentSetting(\Auth::user()->creatorId());
    }
?>

<?php $__env->startSection('action-button'); ?>

    <?php if($invoice->getDue($invoice->id) > 0): ?>
        <a href="#" data-toggle="modal" data-bs-toggle="tooltip" data-bs-original-title="<?php echo e(__('Pay Now')); ?>" data-size="lg"
            data-target="#paymentModal" class="btn btn-sm btn-white btn-icon rounded-pill mt-3">
            <span class="btn-inner--text"><?php echo e(__('Pay Now')); ?></span>
        </a>
    <?php endif; ?>

    <a href="<?php echo e(route('invoice.download.pdf', \Crypt::encrypt($invoice->id))); ?>" target="_blank"
        class="btn btn-sm btn-white btn-icon rounded-pill mt-3">
        <span class="btn-inner--text"><?php echo e(__('Print')); ?></span>
    </a>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-10">
            <div class="card">
                <div class="card-body">
                    <dl class="row">
                        <div class="col-12">
                            <div class="row align-items-center mb-5">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-8">
                                            <h6 class="d-inline-block m-0 d-print-none"><?php echo e(__('Invoice ID')); ?></h6>
                                            <span class="col-sm-8">
                                                <span
                                                    class="text-sm"><?php echo e(App\Models\User::invoiceNumberFormat($invoice->id)); ?></span>
                                            </span>
                                        </div>
                                    </div>

                                    <div class="row mb-5">
                                        <div class="col-lg-6 col-md-8">
                                            <h6 class="d-inline-block m-0 d-print-none"><?php echo e(__('Invoice Date')); ?></h6>
                                            <span class="col-sm-8"><span
                                                    class="text-sm"><?php echo e(App\Models\User::dateFormat($invoice->created_at)); ?></span></span>
                                        </div>
                                    </div>

                                </div>
                                <div>
                                    <div class="col-lg-6 col-md-6" style="right: -391px; padding-top: 10px;">
                                        <span
                                            class="badge badge-pill badge-<?php echo e(\App\Models\Invoice::$status_color[$invoice->status]); ?> ml-3">
                                            <?php echo e(__(\App\Models\Invoice::$status[$invoice->status])); ?></span>
                                    </div>

                                    <div class="col-lg-6 col-md-6 text-align-right "
                                        style="right: -356px; padding-top: 10px;" style="position: relative">
                                        <?php echo DNS2D::getBarcodeHTML(
                                            route('pay.invoice', \Illuminate\Support\Facades\Crypt::encrypt($invoice->id)),'QRCODE',2,2,); ?>

                                    </div>
                                </div>
                            </div>
                            <div class="row pt-3">
                                <div class="col-md-4 text-sm">
                                    <strong><?php echo e(__('Project')); ?></strong><br>
                                    <?php echo e($invoice->project->title); ?><br>
                                </div>
                                <div class="col-md-4 text-sm text-center">
                                    <strong><?php echo e(__('Due Date')); ?></strong><br>
                                    <?php echo e(\App\Models\Utility::getDateFormated($invoice->due_date)); ?><br>
                                </div>
                                <div class="col-md-4 text-sm text-right">
                                    <strong><?php echo e(__('Due Amount')); ?></strong><br>
                                    <?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,$invoice->getDue())); ?><br>
                                </div>
                                <div class="col-12">
                                    <hr>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <h5><?php echo e(__('Item List')); ?></h5>
                                    <div class="table-responsive">
                                        <table class="table mb-0">
                                            <thead>
                                                <tr>
                                                    <th class="px-0 col-lg-4 bg-transparent border-top-0">
                                                        <?php echo e(__('Item')); ?></th>
                                                    <th class="px-0 col-lg-4 bg-transparent border-top-0">
                                                        <?php echo e(__('Price')); ?></th>
                                                    <th class="px-0 col-lg-4 bg-transparent border-top-0">
                                                        <?php echo e(__('Tax')); ?></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php
                                                    $totalQuantity = 0;
                                                    $totalRate = 0;
                                                    $totalAmount = 0;
                                                    $totalTaxPrice = 0;
                                                    $totalDiscount = 0;
                                                    $taxesData = [];
                                                ?>
                                                <?php $__currentLoopData = $invoice->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $invoiceitem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <?php
                                                        // $taxes=App\Models\Utility::tax($invoiceitem->tax);
                                                        $totalQuantity += $invoiceitem->quantity;
                                                        $totalRate += $invoiceitem->price;
                                                        $totalDiscount += $invoiceitem->discount;
                                                        if (!empty($taxes[0])) {
                                                            foreach ($taxes as $taxe) {
                                                                $taxDataPrice = App\Models\Utility::taxRate($taxe->rate, $invoiceitem->price, $invoiceitem->quantity);
                                                                if (array_key_exists($taxe->tax_name, $taxesData)) {
                                                                    $taxesData[$taxe->tax_name] = $taxesData[$taxe->tax_name] + $taxDataPrice;
                                                                } else {
                                                                    $taxesData[$taxe->tax_name] = $taxDataPrice;
                                                                }
                                                            }
                                                        }
                                                    ?>

                                                    <tr>
                                                        <td class="px-0"><?php echo e($invoiceitem->item); ?> </td>

                                                        <td class="px-0">
                                                            <?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,$invoiceitem->price)); ?>

                                                            
                                                         </td>

                                                        <td class="px-0">
                                                            <?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id, $taxes)); ?>

                                                        </td>
                                                    </tr>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                                
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4">&nbsp;</td>
                                                    <td class="px-0"></td>
                                                    <td class="text-right"><strong><?php echo e(__('Sub Total')); ?></strong></td>

                                                    <td class="text-right subTotal">
                                                        <?php echo e(App\Models\User::priceFormat($invoice->getSubTotal())); ?></td>

                                                </tr>

                                                <tr>
                                                    <td colspan="4">&nbsp;</td>
                                                    <td class="px-0"></td>
                                                    <td class="text-right"><strong><?php echo e(__('Discount')); ?></strong></td>
                                                    <td class="text-right subTotal">
                                                        <?php echo e(App\Models\User::priceFormat($invoice->getTotalDiscount())); ?>

                                                    </td>

                                                </tr>
                                                <?php if(!empty($taxesData)): ?>
                                                    <?php $__currentLoopData = $taxesData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $taxName => $taxPrice): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <?php if($taxName != 'No Tax'): ?>
                                                            <tr>
                                                                <td colspan="4"></td>
                                                                <td class="px-0"></td>
                                                                <td class="text-right"><b><?php echo e($taxName); ?></b></td>
                                                                <td class="text-right">
                                                                    <?php echo e(App\Models\User::priceFormat($taxPrice)); ?></td>

                                                            </tr>
                                                        <?php endif; ?>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <?php endif; ?>
                                                <tr>
                                                    <td colspan="4">&nbsp;</td>
                                                    <td class="px-0"></td>
                                                    <td class="text-right"><strong><?php echo e(__('Total')); ?></strong></td>
                                                    <td class="text-right subTotal">
                                                        <?php echo e(App\Models\User::priceFormat(round($invoice->getTotal()))); ?></td>

                                                </tr>
                                            </tfoot>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="card my-5 bg-secondary">
                                        <div class="card-body">
                                            <div class="row justify-content-between align-items-center">
                                                <div class="col-md-6 order-md-2 mb-4 mb-md-0">
                                                    <div class="d-flex align-items-center justify-content-md-end">
                                                        <span class="h6 text-muted d-inline-block mr-3 mb-0"><?php echo e(__('Total value')); ?>:</span>
                                                        <span class="h4 mb-0">  <?php echo e(App\Models\User::priceFormat(round($invoice->getTotal()))); ?></span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 order-md-1">

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-12 col-md-4">
                                    <h5><?php echo e(__('From')); ?></h5>
                                    <dl class="row mt-4 align-items-center">
                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Company Address')); ?></span></dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($left_address['address']); ?></span></dd>

                                        <dt class="col-sm-6"><span class="h6 text-sm mb-0"><?php echo e(__('Company City')); ?></span>
                                        </dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($left_address['city']); ?></span></dd>

                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Company Country')); ?></span></dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($left_address['country']); ?></span></dd>

                                        <dt class="col-sm-6"><span class="h6 text-sm mb-0"><?php echo e(__('Zip Code')); ?></span></dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($left_address['zipcode']); ?></span></dd>

                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Company Contact')); ?></span></dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($left_address['telephone']); ?></span></dd>
                                    </dl>
                                </div>
                                <div class="col-12 col-md-4">
                                    <h5><?php echo e(__('Billing Address')); ?></h5>
                                    <dl class="row mt-4 align-items-center">
                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Billing Address')); ?></span></dt>
                                        <dd class="col-sm-6"><span class="text-sm"><?php echo e($left_address['address']); ?></span>
                                        </dd>

                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Billing City')); ?></span></dt>
                                        <dd class="col-sm-6"><span class="text-sm"><?php echo e($left_address['city']); ?></span>
                                        </dd>

                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Billing Country')); ?></span></dt>
                                        <dd class="col-sm-6"><span class="text-sm"><?php echo e($left_address['country']); ?></span>
                                        </dd>

                                        <dt class="col-sm-6"><span class="h6 text-sm mb-0"><?php echo e(__('Zip Code')); ?></span>
                                        </dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($left_address['zipcode']); ?></span></dd>

                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Billing Contact')); ?></span></dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e(!empty($left_address->contacts->name) ? $left_address->contacts->name : '--'); ?></span>
                                        </dd>
                                    </dl>
                                </div>

                                <div class="col-12 col-md-4">
                                    <h5><?php echo e(__('Shipping Address')); ?></h5>
                                    <dl class="row mt-4 align-items-center">
                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Shipping Address')); ?></span></dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($right_address['address']); ?></span></dd>

                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Shipping City')); ?></span></dt>
                                        <dd class="col-sm-6"><span class="text-sm"><?php echo e($right_address['city']); ?></span>
                                        </dd>

                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Shipping Country')); ?></span></dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($right_address['country']); ?></span></dd>

                                        <dt class="col-sm-6"><span class="h6 text-sm mb-0"><?php echo e(__('Zip Code')); ?></span>
                                        </dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e($right_address['zipcode']); ?></span></dd>

                                        <dt class="col-sm-6"><span
                                                class="h6 text-sm mb-0"><?php echo e(__('Shipping Contact')); ?></span></dt>
                                        <dd class="col-sm-6"><span
                                                class="text-sm"><?php echo e(!empty($invoice->contacts->name) ? $invoice->contacts->name : '--'); ?></span>
                                        </dd>
                                    </dl>
                                </div>
                            </div>
                        </div>
                    </dl>
                </div>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="card">
                <div class="card-footer py-0">
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item px-0">
                            <div class="row align-items-center">
                                

                                <dt class="col-sm-12"><span class="h6 text-sm mb-0"><?php echo e(__('Created')); ?></span></dt>
                                <dd class="col-sm-12"><span
                                        class="text-sm"><?php echo e(App\Models\User::dateFormat($invoice->created_at)); ?></span>
                                </dd>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-10">
            <div class="row">
                <div class="col-12">
                    <h4 class="h4 font-weight-400 float-left"><?php echo e(__('Payment History')); ?></h4>
                </div>
                <?php if($plan): ?>
                    <?php if($plan->storage_limit <= $total_storage && $plan->storage_limit != -1): ?>
                        <h6><span class="text-danger col-lg-10"><?php echo e(__('Note : Your plan storage limit is over , so you can not see customer uploaded payment receipt.')); ?></span></h6>
                    <?php endif; ?>
                <?php endif; ?>
                <div class="col-12">
                    <div class="card">
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <thead>
                                    <tr>
                                        <th><?php echo e(__('Transaction ID')); ?></th>
                                        <th><?php echo e(__('Payment Date')); ?></th>
                                        <th><?php echo e(__('Payment Type')); ?></th>
                                        <th><?php echo e(__('Receipt')); ?></th>
                                        <th><?php echo e(__('Note')); ?></th>
                                        <th><?php echo e(__('Amount')); ?></th>
                                    </tr>
                                </thead>

                                <tbody class="list">
                                    <?php $i=0; ?>
                                    <?php $__currentLoopData = $invoice->payments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $payment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <td><?php echo e(sprintf('%05d', $payment->transaction_id)); ?></td>
                                            <td><?php echo e(App\Models\User::dateFormat($payment->date)); ?></td>
                                            <td><?php echo e($payment->payment_type); ?></td>
                                            <td><?php echo e('-'); ?></td>
                                            <td><?php echo e(!empty($payment->notes) ? $payment->notes : '-'); ?></td>
                                            <td><?php echo e(App\Models\User::priceFormat($payment->amount)); ?>

                                            </td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    <?php $__currentLoopData = $bankpayments; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $bankpayment): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <td><?php echo e(sprintf('%05d', $bankpayment->order_id)); ?></td>
                                            <td><?php echo e(App\Models\User::dateFormat($bankpayment->date)); ?></td>
                                            <td><?php echo e('Bank Transfer'); ?></td>
                                            <td>
                                                <?php if($plan->storage_limit <= $total_storage != -1): ?>
                                                <a href="<?php echo e(\App\Models\Utility::get_file($bankpayment->receipt)); ?>"  title="Invoice" target="_blank"
                                                    class="text-center">
                                                    <i class="fas fa-file-invoice"></i>
                                                </a>
                                                <?php else: ?>
                                                    <?php echo e('-'); ?>

                                                <?php endif; ?>
                                            </td>
                                            <td><?php echo e((!empty($bankpayment->notes)) ? $bankpayment->notes : '-'); ?></td>
                                            <td><?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,$bankpayment->amount,true)); ?></td>
                                        </tr>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="paymentModal" tabindex="-1" role="dialog" aria-labelledby="paymentModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="paymentModalLabel"><?php echo e(__('Add Payment')); ?></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="card">
                    <ul class="nav nav-pills mt-4" role="tablist">
                        <?php if(isset($payment_detail['is_bank_tranfer_enabled']) && $payment_detail['is_bank_tranfer_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a href="#bank-payment" class="nav-link active" data-toggle="tab" role="tab" aria-controls="bank" aria-selected="false">
                                    <?php echo e(__('Bank Transfer')); ?>

                                </a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['enable_stripe']) && $payment_detail['enable_stripe'] == 'on'): ?>
                            <?php if(isset($payment_detail['stripe_key']) &&
                                    !empty($payment_detail['stripe_key']) &&
                                    (isset($payment_detail['stripe_secret']) && !empty($payment_detail['stripe_secret']))): ?>
                                <li class="nav-item ml-4">
                                    <a href="#stripe-payment" class="nav-link" data-toggle="tab" role="tab"
                                        aria-selected="false">
                                        <?php echo e(__('Stripe')); ?>

                                    </a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['enable_paypal']) && $payment_detail['enable_paypal'] == 'on'): ?>
                            <?php if(isset($payment_detail['paypal_client_id']) &&
                                    !empty($payment_detail['paypal_client_id']) &&
                                    (isset($payment_detail['paypal_secret_key']) && !empty($payment_detail['paypal_secret_key']))): ?>
                                <li class="nav-item ml-4">
                                    <a data-toggle="tab" href="#paypal-payment" class="nav-link" role="tab"
                                        aria-controls="paypal" aria-selected="false"><?php echo e(__('Paypal')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_paystack_enabled']) && $payment_detail['is_paystack_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['paystack_public_key']) &&
                                    !empty($payment_detail['paystack_public_key']) &&
                                    (isset($payment_detail['paystack_secret_key']) && !empty($payment_detail['paystack_secret_key']))): ?>
                                <li class="nav-item ml-4">
                                    <a data-toggle="tab" href="#paystack-payment" class="nav-link" role="tab"
                                        aria-controls="paystack" aria-selected="false"><?php echo e(__('Paystack')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_flutterwave_enabled']) && $payment_detail['is_flutterwave_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['flutterwave_secret_key']) &&
                                    !empty($payment_detail['flutterwave_secret_key']) &&
                                    (isset($payment_detail['flutterwave_public_key']) && !empty($payment_detail['flutterwave_public_key']))): ?>
                                <li class="nav-item ml-4">
                                    <a data-toggle="tab" href="#flutterwave-payment" class="nav-link" role="tab"
                                        aria-controls="flutterwave" aria-selected="false"><?php echo e(__('Flutterwave')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_razorpay_enabled']) && $payment_detail['is_razorpay_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['razorpay_secret_key']) &&
                                    !empty($payment_detail['razorpay_secret_key']) &&
                                    (isset($payment_detail['razorpay_public_key']) && !empty($payment_detail['razorpay_public_key']))): ?>
                                <li class="nav-item ml-4">
                                    <a data-toggle="tab" href="#razorpay-payment" class="nav-link" role="tab"
                                        aria-controls="razorpay" aria-selected="false"><?php echo e(__('Razorpay')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_mercado_enabled']) && $payment_detail['is_mercado_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a data-toggle="tab" href="#mercado-payment" class="nav-link" role="tab"
                                    aria-controls="mercado" aria-selected="false"><?php echo e(__('Mercado Pago')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_paytm_enabled']) && $payment_detail['is_paytm_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['paytm_merchant_id']) &&
                                    !empty($payment_detail['paytm_merchant_id']) &&
                                    (isset($payment_detail['paytm_merchant_key']) && !empty($payment_detail['paytm_merchant_key']))): ?>
                                <li class="nav-item ml-4">
                                    <a data-toggle="tab" href="#paytm-payment" class="nav-link" role="tab"
                                        aria-controls="paytm" aria-selected="false"><?php echo e(__('Paytm')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_mollie_enabled']) && $payment_detail['is_mollie_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['mollie_api_key']) &&
                                    !empty($payment_detail['mollie_api_key']) &&
                                    (isset($payment_detail['mollie_profile_id']) && !empty($payment_detail['mollie_profile_id']))): ?>
                                <li class="nav-item ml-4">
                                    <a data-toggle="tab" href="#mollie-payment" class="nav-link" role="tab"
                                        aria-controls="mollie" aria-selected="false"><?php echo e(__('Mollie')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_skrill_enabled']) && $payment_detail['is_skrill_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['skrill_email']) && !empty($payment_detail['skrill_email'])): ?>
                                <li class="nav-item ml-4">
                                    <a data-toggle="tab" href="#skrill-payment" class="nav-link" role="tab"
                                        aria-controls="skrill" aria-selected="false"><?php echo e(__('Skrill')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_coingate_enabled']) && $payment_detail['is_coingate_enabled'] == 'on'): ?>

                            <li class="nav-item ml-4">
                                <a data-toggle="tab" href="#coingate-payment" class="nav-link" role="tab"
                                    aria-controls="coingate" aria-selected="false"><?php echo e(__('CoinGate')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_payfast_enabled']) && $payment_detail['is_payfast_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a data-toggle="tab" href="#payfast-payment" class="nav-link" role="tab"
                                    aria-controls="payfast" aria-selected="false"><?php echo e(__('Payfast')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_paymentwall_enabled']) && $payment_detail['is_paymentwall_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#paymentwall-payment" role="tab"
                                    aria-controls="paymentwall" aria-selected="false"><?php echo e(__('PaymentWall')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_toyyibpay_enabled']) && $payment_detail['is_toyyibpay_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#toyyibpay-payment" role="tab"
                                    aria-controls="toyyibpay" aria-selected="false"><?php echo e(__('Toyyibpay')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_iyzipay_enabled']) && $payment_detail['is_iyzipay_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#iyzipay-payment" role="tab"
                                    aria-controls="iyzipay" aria-selected="false"><?php echo e(__('Iyzipay')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_sspay_enabled']) && $payment_detail['is_sspay_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['sspay_category_code']) &&
                                        !empty($payment_detail['sspay_category_code']) &&
                                        (isset($payment_detail['sspay_secret_key']) && !empty($payment_detail['sspay_secret_key']))): ?>
                                <li class="nav-item ml-4">
                                    <a class="nav-link" data-toggle="tab" href="#sspay-payment" role="tab"
                                        aria-controls="sspay" aria-selected="false"><?php echo e(__('Sspay')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_paytab_enabled']) && $payment_detail['is_paytab_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['paytab_profile_id']) &&
                                        !empty($payment_detail['paytab_profile_id']) &&
                                        (isset($payment_detail['paytab_server_key']) && !empty($payment_detail['paytab_server_key'])) && (isset($payment_detail['paytab_region']) && !empty($payment_detail['paytab_region']))): ?>
                                <li class="nav-item ml-4">
                                    <a class="nav-link" data-toggle="tab" href="#paytab-payment" role="tab"
                                        aria-controls="paytab" aria-selected="false"><?php echo e(__('Paytab')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_benefit_enabled']) && $payment_detail['is_benefit_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['benefit_api_key']) && !empty($payment_detail['benefit_api_key']) &&
                                    (isset($payment_detail['benefit_secret_key']) && !empty($payment_detail['benefit_secret_key']))): ?>
                                <li class="nav-item ml-4">
                                    <a class="nav-link" data-toggle="tab" href="#benefit-payment" role="tab"
                                        aria-controls="benefit" aria-selected="false"><?php echo e(__('Benefit')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_cashfree_enabled']) && $payment_detail['is_cashfree_enabled'] == 'on'): ?>
                            <?php if(isset($payment_detail['cashfree_api_key']) && !empty($payment_detail['cashfree_api_key']) &&
                                    (isset($payment_detail['cashfree_secret_key']) && !empty($payment_detail['cashfree_secret_key']))): ?>
                                <li class="nav-item ml-4">
                                    <a class="nav-link" data-toggle="tab" href="#cashfree-payment" role="tab"
                                        aria-controls="cashfree" aria-selected="false"><?php echo e(__('Cashfree')); ?></a>
                                </li>
                            <?php endif; ?>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_aamarpay_enabled']) && $payment_detail['is_aamarpay_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#aamarpay-payment" role="tab"
                                    aria-controls="aamarpay" aria-selected="false"><?php echo e(__('Aamarpay')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_paytr_enabled']) && $payment_detail['is_paytr_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#paytr-payment" role="tab"
                                    aria-controls="paytr" aria-selected="false"><?php echo e(__('PayTR')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_yookassa_enabled']) && $payment_detail['is_yookassa_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#yookassa-payment" role="tab"
                                    aria-controls="yookassa" aria-selected="false"><?php echo e(__('Yookassa')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_xendit_enabled']) && $payment_detail['is_xendit_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#xendit-payment" role="tab"
                                    aria-controls="xendit" aria-selected="false"><?php echo e(__('Xendit')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_midtrans_enabled']) && $payment_detail['is_midtrans_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#midtrans-payment" role="tab"
                                    aria-controls="midtrans" aria-selected="false"><?php echo e(__('Midtrans')); ?></a>
                            </li>
                        <?php endif; ?>

                        <?php if(isset($payment_detail['is_fedapay_enabled']) && $payment_detail['is_fedapay_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#fedapay-payment" role="tab"
                                    aria-controls="fedapay" aria-selected="false"><?php echo e(__('Fedapay')); ?></a>
                            </li>
                        <?php endif; ?>
                        <?php if(isset($payment_detail['is_paiementpro_enabled']) && $payment_detail['is_paiementpro_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#paiementpro-payment" role="tab"
                                    aria-controls="paiementpro" aria-selected="false"><?php echo e(__('Paiement Pro')); ?></a>
                            </li>
                        <?php endif; ?>
                        <?php if(isset($payment_detail['is_nepalste_enabled']) && $payment_detail['is_nepalste_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#nepalste-payment" role="tab"
                                    aria-controls="nepalste" aria-selected="false"><?php echo e(__('Nepalste')); ?></a>
                            </li>
                        <?php endif; ?>
                        <?php if(isset($payment_detail['is_payhere_enabled']) && $payment_detail['is_payhere_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#payhere-payment" role="tab"
                                    aria-controls="payhere" aria-selected="false"><?php echo e(__('PayHere')); ?></a>
                            </li>
                        <?php endif; ?>
                        <?php if(isset($payment_detail['is_cinetpay_enabled']) && $payment_detail['is_cinetpay_enabled'] == 'on'): ?>
                            <li class="nav-item ml-4">
                                <a class="nav-link" data-toggle="tab" href="#cinetpay-payment" role="tab"
                                    aria-controls="cinetpay" aria-selected="false"><?php echo e(__('Cinetpay')); ?></a>
                            </li>
                        <?php endif; ?>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="bank-payment" role="tabpanel" aria-labelledby="bank-payment-tab">
                            <div class="card-body">

                                <form method="post" action="<?php echo e(route('invoice.pay.with.bank')); ?>"
                                     id="bank-payment-form" enctype = "multipart/form-data">
                                    <?php echo csrf_field(); ?>
                                    <div class="border p-3 mb-3 rounded">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label class="form-label"><b><?php echo e(__('Bank Details:')); ?></b></label>
                                                <div class="form-group">
                                                    <?php if(isset($payment_detail) && !empty($payment_detail['bank_details'])): ?>
                                                        <?php echo $payment_detail['bank_details']; ?>

                                                    <?php endif; ?>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mt-4">
                                                <div class="form-group">
                                                    <?php echo e(Form::label('payment_receipt', __('Payment Receipt'), ['class' => 'form-control-label'])); ?>

                                                    <input type="file" name="payment_receipt" id="payment_receipt"
                                                        class="custom-input-file"
                                                        onchange="document.getElementById('payment_receipt_pre').src = window.URL.createObjectURL(this.files[0])" />
                                                    <label for="payment_receipt">
                                                        <i class="fa fa-upload"></i>
                                                        <span><?php echo e(__('Choose a file…')); ?></span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="amount"
                                                    class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                <div class="input-group">
                                                    <span class="input-group-prepend"><span
                                                            class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                    <input class="form-control" required="required" min="0"
                                                        name="amount" type="number"
                                                        value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                        step="0.01" max="" id="amount">
                                                    <input type="hidden" value="invoice" name="from">
                                                    <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                        name="invoice_creator">
                                                    <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                        name="invoice_id">
                                                </div>
                                            </div>
                                        </div>

                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill"
                                            type="submit"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade show" id="stripe-payment" role="tabpanel"
                            aria-labelledby="stripe-payment-tab">
                            <div class="card-body">
                                <?php if(isset($payment_detail['enable_stripe']) && $payment_detail['enable_stripe'] == 'on'): ?>
                                    <?php if(isset($payment_detail['stripe_key']) &&
                                            !empty($payment_detail['stripe_key']) &&
                                            (isset($payment_detail['stripe_secret']) && !empty($payment_detail['stripe_secret']))): ?>
                                        <form method="post"
                                            action="<?php echo e(route('invoice.pay.with.stripe', \Crypt::encrypt($invoice->id))); ?>"
                                            class="require-validation" id="payment-form">
                                            <?php echo csrf_field(); ?>
                                            <div class="border p-3 mb-3 rounded">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <br>
                                                        <label for="amount"
                                                            class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                        <div class="input-group">
                                                            <span class="input-group-prepend"><span
                                                                    class="input-group-text"><?php echo e($invoice->project->currency); ?></span></span>
                                                            <input class="form-control" required="required" min="1"
                                                                name="amount" type="number"
                                                                value="<?php echo e($invoice->getDue()); ?>" step="0.01"
                                                                id="amount">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12">
                                                        <div class="error" style="display: none;">
                                                            <div class='alert-danger alert'>
                                                                <?php echo e(__('Please correct the errors and try again.')); ?></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3 text-sm-right">
                                                <button class="btn btn-primary btn-sm rounded-pill"
                                                    type="submit"><?php echo e(__('Make Payment')); ?></button>
                                            </div>
                                        </form>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="paypal-payment" role="tabpanel"
                            aria-labelledby="paypal-payment-tab">
                            <div class="card-body">
                                <?php if(isset($payment_detail['enable_paypal']) && $payment_detail['enable_paypal'] == 'on'): ?>
                                    <?php if(isset($payment_detail['paypal_client_id']) &&
                                            !empty($payment_detail['paypal_client_id']) &&
                                            (isset($payment_detail['paypal_secret_key']) && !empty($payment_detail['paypal_secret_key']))): ?>
                                        <form class="w3-container w3-display-middle w3-card-4 " method="POST"
                                            id="payment-form"
                                            action="<?php echo e(route('client.pay.with.paypal', $invoice->id)); ?>">
                                            <?php echo csrf_field(); ?>
                                            <div class="border p-3 mb-3 rounded">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label for="amount"
                                                            class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                        <div class="input-group">
                                                            <span class="input-group-prepend"><span
                                                                    class="input-group-text"><?php echo e($invoice->project->currency); ?></span></span>
                                                            <input class="form-control" required="required"
                                                                min="0" name="amount" type="number"
                                                                value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                                step="0.01" max="<?php echo e($invoice->getDue()); ?>"
                                                                id="amount">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3 text-sm-right">
                                                <input type="hidden" value="invoice" name="from">
                                                <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                    name="invoice_creator">
                                                <button class="btn btn-primary btn-sm rounded-pill" name="submit"
                                                    type="submit"><?php echo e(__('Make Payment')); ?></button>
                                            </div>
                                        </form>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="paystack-payment" role="tabpanel"
                            aria-labelledby="paystack-payment-tab">
                            <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.pay.with.paystack')); ?>"
                                        class="require-validation" id="paystack-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount"
                                                        class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number"
                                                            value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                            step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                            name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 form-group mt-3 text-right">
                                            <input type="button" value="<?php echo e(__('Make Payment')); ?>"
                                                class="btn btn-sm btn-primary rounded-pill" id="pay_with_paystack">
                                        </div>
                                    </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="flutterwave-payment" role="tabpanel"
                            aria-labelledby="flutterwave-payment-tab">
                            <div class="card-body">
                                

                                        <form method="post" action="<?php echo e(route('invoice.pay.with.flaterwave')); ?>"
                                            class="require-validation" id="flaterwave-payment-form">
                                            <?php echo csrf_field(); ?>
                                            <div class="border p-3 mb-3 rounded">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label class="form-control-label"
                                                            for="amount"><?php echo e(__('Amount')); ?></label>
                                                        <div class="input-group">
                                                            <span class="input-group-prepend"><span
                                                                    class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                            <input class="form-control" required="required"
                                                                min="0" name="amount" type="number"
                                                                value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                                step="0.01" max="" id="amount">
                                                            <input type="hidden" value="invoice" name="from">
                                                            <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                                name="invoice_creator">
                                                            <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                                name="invoice_id">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3 text-sm-right">
                                                <button class="btn btn-primary btn-sm rounded-pill" type="button"
                                                    id="pay_with_flaterwave"><?php echo e(__('Make Payment')); ?></button>
                                            </div>
                                        </form>
                                
                            </div>
                        </div>
                        <div class="tab-pane fade" id="razorpay-payment" role="tabpanel"
                            aria-labelledby="razorpay-payment-tab">
                            <div class="card-body">
                                <?php if(isset($payment_detail['is_razorpay_enabled']) && $payment_detail['is_razorpay_enabled'] == 'on'): ?>
                                    <form method="post" action="<?php echo e(route('invoice.pay.with.razorpay')); ?>"
                                        class="require-validation" id="razorpay-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label class="form-control-label"
                                                        for="amount"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number"
                                                            value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                            step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                            name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 form-group mt-3 text-right">
                                            <input type="button" value="<?php echo e(__('Make Payment')); ?>"
                                                class="btn btn-sm btn-primary rounded-pill" id="pay_with_razerpay">
                                        </div>
                                    </form>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="mollie-payment" role="tabpanel"
                            aria-labelledby="mollie-payment-tab">
                            <div class="card-body">

                                <?php if(isset($payment_detail['is_mollie_enabled']) && $payment_detail['is_mollie_enabled'] == 'on'): ?>
                                    <?php if(isset($payment_detail['mollie_api_key']) &&
                                            !empty($payment_detail['mollie_api_key']) &&
                                            (isset($payment_detail['mollie_profile_id']) && !empty($payment_detail['mollie_profile_id']))): ?>
                                        <form method="post" action="<?php echo e(route('invoice.pay.with.mollie')); ?>"
                                            class="require-validation" id="mollie-payment-form">
                                            <?php echo csrf_field(); ?>
                                            <div class="border p-3 mb-3 rounded">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label class="form-control-label"
                                                            for="amount"><?php echo e(__('Amount')); ?></label>
                                                        <div class="input-group">
                                                            <span class="input-group-prepend"><span
                                                                    class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                            <input class="form-control" required="required"
                                                                min="0" name="amount" type="number"
                                                                value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                                step="0.01" max="" id="amount">
                                                            <input type="hidden" value="invoice" name="from">
                                                            <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                                name="invoice_creator">
                                                            <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                                name="invoice_id">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3 text-sm-right">
                                                <button class="btn btn-primary btn-sm rounded-pill"
                                                    type="submit"><?php echo e(__('Make Payment')); ?></button>
                                            </div>
                                        </form>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="mercado-payment" role="tabpanel"
                            aria-labelledby="mercado-payment">
                            <div class="card-body">
                            <form method="post" action="<?php echo e(route('invoice.pay.with.mercado')); ?>"
                                class="require-validation" id="mercado-form">
                                <?php echo csrf_field(); ?>
                                <div class="border p-3 mb-3 rounded">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label class="form-control-label" for="amount"><?php echo e(__('Amount')); ?></label>
                                            <div class="input-group">
                                                <span class="input-group-prepend"><span
                                                        class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                <input class="form-control" required="required" min="0"
                                                    name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                    min="0" step="0.01" max="" id="amount">
                                                <input type="hidden" value="invoice" name="from">
                                                <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                    name="invoice_creator">
                                                <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mt-3 text-sm-right">
                                    <button class="btn btn-primary btn-sm rounded-pill"
                                        type="submit"><?php echo e(__('Make Payment')); ?></button>
                                </div>
                            </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="paytm-payment" role="tabpanel"
                            aria-labelledby="paytm-payment-tab">
                            <div class="card-body">
                                <?php if(isset($payment_detail['is_paytm_enabled']) && $payment_detail['is_paytm_enabled'] == 'on'): ?>
                                    <?php if(isset($payment_detail['paytm_merchant_id']) &&
                                            !empty($payment_detail['paytm_merchant_id']) &&
                                            (isset($payment_detail['paytm_merchant_key']) && !empty($payment_detail['paytm_merchant_key']))): ?>
                                        <form method="post" action="<?php echo e(route('invoice.pay.with.paytm')); ?>"
                                            class="require-validation" id="paytm-payment-form">
                                            <?php echo csrf_field(); ?>
                                            <div class="border p-3 mb-3 rounded">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label class="form-control-label"
                                                            for="amount"><?php echo e(__('Amount')); ?></label>
                                                        <div class="input-group">
                                                            <span class="input-group-prepend"><span
                                                                    class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                            <input class="form-control" required="required"
                                                                min="0" name="amount" type="number"
                                                                value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                                step="0.01" max="" id="amount">
                                                            <input type="hidden" value="invoice" name="from">
                                                            <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                                name="invoice_creator">
                                                            <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                                name="invoice_id">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <label for="mobile"
                                                                class="form-control-label text-dark"><?php echo e(__('Mobile Number')); ?></label>
                                                            <input type="text" id="mobile" name="mobile"
                                                                class="form-control mobile" data-from="mobile"
                                                                placeholder="Enter Mobile Number" required="">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3 text-sm-right">
                                                <button class="btn btn-primary btn-sm rounded-pill"
                                                    type="submit"><?php echo e(__('Make Payment')); ?></button>
                                            </div>
                                        </form>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="skrill-payment" role="tabpanel"
                            aria-labelledby="skrill-payment-tab">
                            <div class="card-body">
                                <?php if(isset($payment_detail['is_skrill_enabled']) && $payment_detail['is_skrill_enabled'] == 'on'): ?>
                                    <?php if(isset($payment_detail['skrill_email']) && !empty($payment_detail['skrill_email'])): ?>
                                        <form method="post" action="<?php echo e(route('invoice.pay.with.skrill')); ?>"
                                            class="require-validation" id="skrill-payment-form">
                                            <?php echo csrf_field(); ?>
                                            <div class="border p-3 mb-3 rounded">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label class="form-control-label"
                                                            for="amount"><?php echo e(__('Amount')); ?></label>
                                                        <div class="input-group">
                                                            <span class="input-group-prepend"><span
                                                                    class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                            <input class="form-control" required="required"
                                                                min="0" name="amount" type="number"
                                                                value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                                step="0.01" max="" id="amount">
                                                            <input type="hidden" value="invoice" name="from">
                                                            <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                                name="invoice_creator">
                                                            <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                                name="invoice_id">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="error" style="display: none;">
                                                        <div class='alert-danger alert'>
                                                            <?php echo e(__('Please correct the errors and try again.')); ?></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3 text-sm-right">
                                                <button class="btn btn-primary btn-sm rounded-pill"
                                                    type="submit"><?php echo e(__('Make Payment')); ?></button>
                                            </div>
                                        </form>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="coingate-payment" role="tabpanel"
                            aria-labelledby="coingate-payment-tab">
                            <div class="card-body">
                                <?php if(isset($payment_detail['is_coingate_enabled']) && $payment_detail['is_coingate_enabled'] == 'on'): ?>
                                    <?php if(isset($payment_detail['coingate_auth_token']) && !empty($payment_detail['coingate_auth_token'])): ?>
                                        <form method="post" action="<?php echo e(route('invoice.pay.with.coingate')); ?>"
                                            class="require-validation" id="coingate-payment-form">
                                            <?php echo csrf_field(); ?>

                                            <div class="border p-3 mb-3 rounded">
                                                <div class="row">
                                                    <div class="form-group col-md-12">
                                                        <label class="form-control-label"
                                                            for="amount"><?php echo e(__('Amount')); ?></label>
                                                        <div class="input-group">
                                                            <span class="input-group-prepend"><span
                                                                    class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                            <input class="form-control" required="required"
                                                                min="0" name="amount" type="number"
                                                                value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                                step="0.01" max="" id="amount">
                                                            <input type="hidden" value="invoice" name="from">
                                                            <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                                name="invoice_creator">
                                                            <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                                name="invoice_id">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="error" style="display: none;">
                                                        <div class='alert-danger alert'>
                                                            <?php echo e(__('Please correct the errors and try again.')); ?></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-3 text-sm-right">
                                                <button class="btn btn-primary btn-sm rounded-pill"
                                                    type="submit"><?php echo e(__('Make Payment')); ?></button>
                                            </div>
                                        </form>
                                    <?php endif; ?>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="toyyibpay-payment" role="tabpanel"
                            aria-labelledby="toyyibpay-payment">
                            <div class="card-body">
                                <form method="post" action="<?php echo e(route('invoice.pay.with.toyyibpay', $invoice->id)); ?>"
                                    class="require-validation" id="toyyibpay-payment-form">
                                    <?php echo csrf_field(); ?>
                                    <div class="border p-3 mb-3 rounded">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                <div class="input-group">
                                                    <span class="input-group-prepend"><span
                                                            class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                    <input class="form-control" required="required" min="0"
                                                        name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                        min="0" step="0.01" max="" id="amount">
                                                    <input type="hidden" value="invoice" name="from">
                                                    <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                        name="invoice_creator">
                                                    <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill"
                                            type="submit"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="paymentwall-payment" role="tabpanel"
                            aria-labelledby="paymentwall-payment">
                            <div class="card-body">
                            <form method="post" action="<?php echo e(route('invoice.paymentwallpayment')); ?>"
                                class="require-validation" id="paymentwall-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="border p-3 mb-3 rounded">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                            <div class="input-group">
                                                <span class="input-group-prepend"><span
                                                        class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                <input class="form-control" required="required" min="0"
                                                    name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                    min="0" step="0.01" max="" id="amount">
                                                <input type="hidden" value="invoice" name="from">
                                                <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                    name="invoice_creator">
                                                <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                            id="pay_with_paymentwall"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </div>
                            </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="payfast-payment" role="tabpanel"
                            aria-labelledby="payfast-payment-tab">
                            <div class="card-body">
                                <?php if(isset($payment_detail['is_payfast_enabled']) && $payment_detail['is_payfast_enabled'] == 'on'): ?>
                                    <?php
                                        $pfHost = $payment_detail['payfast_mode'] == 'sandbox' ? 'sandbox.payfast.co.za' : 'www.payfast.co.za';
                                    ?>

                                    <form method="post" action=<?php echo e('https://' . $pfHost . '/eng/process'); ?>

                                        class="require-validation payfast_form" id="payfast-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span>
                                                        </span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number"
                                                            value="<?php echo e($invoice->getDue()); ?>" min="0"
                                                            step="0.01" max="" id="payfast_amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>"
                                                            id="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-end">

                                            <div id="get-payfast-inputs"></div>
                                            <div class="form-group mt-3 text-sm-right">
                                                <button type="button" id="payfast_submit"
                                                    class="btn btn-primary btn-sm rounded-pill"><?php echo e(__('Make Payment')); ?></button>
                                            </div>
                                        </div>
                                    </form>
                                <?php endif; ?>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="iyzipay-payment" role="tabpanel"
                            aria-labelledby="iyzipay-payment">
                            <div class="card-body">
                            <form method="post" action="<?php echo e(route('invoice.pay.with.iyzipay')); ?>"
                                class="require-validation" id="paymentwall-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="border p-3 mb-3 rounded">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                            <div class="input-group">
                                                <span class="input-group-prepend"><span
                                                        class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                <input class="form-control" required="required" min="0"
                                                    name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                    min="0" step="0.01" max="" id="amount">
                                                <input type="hidden" value="invoice" name="from">
                                                <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                    name="invoice_creator">
                                                <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                            id="pay_with_iyzipay"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </div>
                            </form>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="sspay-payment" role="tabpanel"
                            aria-labelledby="sspay-payment">
                            <div class="card-body">
                                <form method="post" action="<?php echo e(route('invoice.pay.with.sspay', $invoice->id)); ?>"
                                    class="require-validation" id="sspay-payment-form">
                                    <?php echo csrf_field(); ?>
                                    <div class="border p-3 mb-3 rounded">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                <div class="input-group">
                                                    <span class="input-group-prepend"><span
                                                            class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                    <input class="form-control" required="required" min="0"
                                                        name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                        min="0" step="0.01" max="" id="amount">
                                                    <input type="hidden" value="invoice" name="from">
                                                    <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                        name="invoice_creator">
                                                    <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill"
                                            type="submit"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="paytab-payment" role="tabpanel"
                            aria-labelledby="paytab-payment">
                            <div class="card-body">
                                <form method="post" action="<?php echo e(route('invoice.pay.with.paytab', $invoice->id)); ?>"
                                    class="require-validation" id="paytab-payment-form">
                                    <?php echo csrf_field(); ?>
                                    <div class="border p-3 mb-3 rounded">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                <div class="input-group">
                                                    <span class="input-group-prepend"><span
                                                            class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                    <input class="form-control" required="required" min="0"
                                                        name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                        min="0" step="0.01" max="" id="amount">
                                                    <input type="hidden" value="invoice" name="from">
                                                    <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                        name="invoice_creator">
                                                    <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill"
                                            type="submit"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="benefit-payment" role="tabpanel"
                            aria-labelledby="benefit-payment">
                            <div class="card-body">
                                <form method="post" action="<?php echo e(route('invoice.pay.with.benefit', $invoice->id)); ?>"
                                    class="require-validation" id="benefit-payment-form">
                                    <?php echo csrf_field(); ?>
                                    <div class="border p-3 mb-3 rounded">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                <div class="input-group">
                                                    <span class="input-group-prepend"><span
                                                            class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                    <input class="form-control" required="required" min="0"
                                                        name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                        min="0" step="0.01" max="" id="amount">
                                                    <input type="hidden" value="invoice" name="from">
                                                    <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                        name="invoice_creator">
                                                    <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill"
                                            type="submit"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="cashfree-payment" role="tabpanel"
                            aria-labelledby="cashfree-payment">
                            <div class="card-body">
                                <form method="post" action="<?php echo e(route('invoice.pay.with.cashfree', $invoice->id)); ?>"
                                    class="require-validation" id="cashfree-payment-form">
                                    <?php echo csrf_field(); ?>
                                    <div class="border p-3 mb-3 rounded">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                <div class="input-group">
                                                    <span class="input-group-prepend"><span
                                                            class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                    <input class="form-control" required="required" min="0"
                                                        name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                        min="0" step="0.01" max="" id="amount">
                                                    <input type="hidden" value="invoice" name="from">
                                                    <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                        name="invoice_creator">
                                                    <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill"
                                            type="submit"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="aamarpay-payment" role="tabpanel"
                            aria-labelledby="aamarpay-payment">
                            <div class="card-body">
                                <form method="post" action="<?php echo e(route('invoice.pay.with.aamarpay', $invoice->id)); ?>"
                                    class="require-validation" id="aamarpay-payment-form">
                                    <?php echo csrf_field(); ?>
                                    <div class="border p-3 mb-3 rounded">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                <div class="input-group">
                                                    <span class="input-group-prepend"><span
                                                            class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                    <input class="form-control" required="required" min="0"
                                                        name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                        min="0" step="0.01" max="" id="amount">
                                                    <input type="hidden" value="invoice" name="from">
                                                    <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                        name="invoice_creator">
                                                    <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill"
                                            type="submit"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade " id="paytr-payment" role="tabpanel"
                            aria-labelledby="paytr-payment">
                                <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.pay.with.paytr', $invoice->id)); ?>"
                                        class="require-validation" id="paytr-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                            min="0" step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3 text-sm-right">
                                            <button class="btn btn-primary btn-sm rounded-pill"
                                                type="submit"><?php echo e(__('Make Payment')); ?></button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                        <div class="tab-pane fade " id="yookassa-payment" role="tabpanel"
                            aria-labelledby="yookassa-payment">
                                <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.with.yookassa', $invoice->id)); ?>"
                                        class="require-validation" id="yookassa-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                            min="0" step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3 text-sm-right">
                                            <button class="btn btn-primary btn-sm rounded-pill"
                                                type="submit"><?php echo e(__('Make Payment')); ?></button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                        <div class="tab-pane fade " id="xendit-payment" role="tabpanel"
                            aria-labelledby="xendit-payment">
                                <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.with.xendit', $invoice->id)); ?>"
                                        class="require-validation" id="xendit-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                            min="0" step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3 text-sm-right">
                                            <button class="btn btn-primary btn-sm rounded-pill"
                                                type="submit"><?php echo e(__('Make Payment')); ?></button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                        <div class="tab-pane fade " id="midtrans-payment" role="tabpanel"
                            aria-labelledby="midtrans-payment">
                                <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.with.midtrans', $invoice->id)); ?>"
                                        class="require-validation" id="midtrans-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                            min="0" step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3 text-sm-right">
                                            <button class="btn btn-primary btn-sm rounded-pill"
                                                type="submit"><?php echo e(__('Make Payment')); ?></button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                        <div class="tab-pane fade " id="fedapay-payment" role="tabpanel"
                            aria-labelledby="fedapay-payment">
                                <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.with.fedapay', $invoice->id)); ?>"
                                        class="require-validation" id="fedapay-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                            min="0" step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3 text-sm-right">
                                            <button class="btn btn-primary btn-sm rounded-pill"
                                                type="submit"><?php echo e(__('Make Payment')); ?></button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                        <div class="tab-pane fade " id="paiementpro-payment" role="tabpanel"
                            aria-labelledby="paiementpro-payment">
                                <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.with.paiementpro', $invoice->id)); ?>"
                                        class="require-validation" id="paiementpro-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="paiementpro_mobile_number"
                                                    class="form-control-label text-dark"><?php echo e(__('Mobile Number')); ?></label>
                                                <input type="text" id="paiementpro_mobile_number" name="mobile_number"
                                                    class="form-control mobile_number" data-from="paiementpro"
                                                    placeholder="<?php echo e(__('Enter Mobile Number')); ?>">
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="paiementpro_channel"
                                                        class="form-control-label text-dark"><?php echo e(__('Channel')); ?></label>
                                                    <input type="text" id="paiementpro_channel" name="channel"
                                                        class="form-control channel" data-from="paiementpro"
                                                        placeholder="<?php echo e(__('Enter Channel')); ?>">
                                                        <small class="text-danger">Example : OMCIV2 , MOMO , CARD , FLOOZ , PAYPAL</small>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                            min="0" step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3 text-sm-right">
                                            <button class="btn btn-primary btn-sm rounded-pill"
                                                type="submit"><?php echo e(__('Make Payment')); ?></button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                        <div class="tab-pane fade " id="nepalste-payment" role="tabpanel"
                            aria-labelledby="nepalste-payment">
                                <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.with.nepalste', $invoice->id)); ?>"
                                        class="require-validation" id="nepalste-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                            min="0" step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3 text-sm-right">
                                            <button class="btn btn-primary btn-sm rounded-pill"
                                                type="submit"><?php echo e(__('Make Payment')); ?></button>
                                        </div>
                                    </form>
                                </div>
                        </div>

                        <div class="tab-pane fade " id="payhere-payment" role="tabpanel"
                            aria-labelledby="payhere-payment">
                            <div class="card-body">
                                <form method="post" action="<?php echo e(route('invoice.with.payhere', $invoice->id)); ?>"
                                    class="require-validation" id="payhere-payment-form">
                                    <?php echo csrf_field(); ?>
                                    <div class="border p-3 mb-3 rounded">
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                <div class="input-group">
                                                    <span class="input-group-prepend"><span
                                                            class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                    <input class="form-control" required="required" min="0"
                                                        name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                        min="0" step="0.01" max="" id="amount">
                                                    <input type="hidden" value="invoice" name="from">
                                                    <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                        name="invoice_creator">
                                                    <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mt-3 text-sm-right">
                                        <button class="btn btn-primary btn-sm rounded-pill"
                                            type="submit"><?php echo e(__('Make Payment')); ?></button>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="tab-pane fade " id="cinetpay-payment" role="tabpanel"
                            aria-labelledby="cinetpay-payment">
                                <div class="card-body">
                                    <form method="post" action="<?php echo e(route('invoice.with.cinetpay', $invoice->id)); ?>"
                                        class="require-validation" id="cinetpay-payment-form">
                                        <?php echo csrf_field(); ?>
                                        <div class="border p-3 mb-3 rounded">
                                            <div class="row">
                                                <div class="form-group col-md-12">
                                                    <label for="amount" class="form-control-label"><?php echo e(__('Amount')); ?></label>
                                                    <div class="input-group">
                                                        <span class="input-group-prepend"><span
                                                                class="input-group-text"><?php echo e(isset($invoice->project->currency) ? $invoice->project->currency : '$'); ?></span></span>
                                                        <input class="form-control" required="required" min="0"
                                                            name="amount" type="number" value="<?php echo e($invoice->getDue()); ?>"
                                                            min="0" step="0.01" max="" id="amount">
                                                        <input type="hidden" value="invoice" name="from">
                                                        <input type="hidden" value="<?php echo e($invoice->created_by); ?>"
                                                            name="invoice_creator">
                                                        <input type="hidden" value="<?php echo e($invoice->id); ?>" name="invoice_id">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group mt-3 text-sm-right">
                                            <button class="btn btn-primary btn-sm rounded-pill"
                                                type="submit"><?php echo e(__('Make Payment')); ?></button>
                                        </div>
                                    </form>
                                </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('script'); ?>
    <script src="<?php echo e(url('assets/js/jquery.form.js')); ?>"></script>
     <?php if($invoice->getDue() > 0 && isset($payment_detail['enable_stripe']) == 'on'): ?>
        <script src="https://js.stripe.com/v3/"></script>
        <script type="text/javascript">
            var stripe = Stripe('<?php echo e(isset($payment_detail['stripe_key'])); ?>');
            var elements = stripe.elements();

            // Custom styling can be passed to options when creating an Element.
            var style = {
                base: {
                    // Add your base input styles here. For example:
                    fontSize: '14px',
                    color: '#32325d',
                },
            };

            // Create an instance of the card Element.
            var card = elements.create('card', {
                style: style
            });

            // Add an instance of the card Element into the `card-element` <div>.
            card.mount('#card-element');

            // Create a token or display an error when the form is submitted.
            var form = document.getElementById('stripe-payment-form');
            form.addEventListener('submit', function(event) {
                event.preventDefault();

                stripe.createToken(card).then(function(result) {
                    if (result.error) {
                        toastr('Error', result.error.message, 'error');
                    } else {
                        // Send the token to your server.
                        stripeTokenHandler(result.token);
                    }
                });
            });

            function stripeTokenHandler(token) {
                // Insert the token ID into the form so it gets submitted to the server
                var form = document.getElementById('stripe-payment-form');
                var hiddenInput = document.createElement('input');
                hiddenInput.setAttribute('type', 'hidden');
                hiddenInput.setAttribute('name', 'stripeToken');
                hiddenInput.setAttribute('value', token.id);
                form.appendChild(hiddenInput);

                // Submit the form
                form.submit();
            }
        </script>
    <?php endif; ?>

    <?php if($invoice->getDue() > 0 && isset($payment_detail['is_paystack_enabled']) && $payment_detail['is_paystack_enabled'] == 'on'): ?>

        <script src="https://js.paystack.co/v1/inline.js"></script>
        <script type="text/javascript">
            $(document).on("click", "#pay_with_paystack", function() {

                $('#paystack-payment-form').ajaxForm(function(res) {

                    if (res.flag == 1) {

                        var coupon_id = res.coupon;
                        var paystack_callback = "<?php echo e(url('/invoice-pay-with-paystack')); ?>";
                        var order_id = '<?php echo e(time()); ?>';
                        var handler = PaystackPop.setup({
                            key: '<?php echo e($payment_detail['paystack_public_key']); ?>',
                            email: res.email,
                            amount: res.total_price * 100,
                            currency: res.currency,
                            ref: 'pay_ref_id' + Math.floor((Math.random() * 1000000000) +
                                1
                            ), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
                            metadata: {
                                custom_fields: [{
                                    display_name: "Email",
                                    variable_name: "email",
                                    value: res.email,
                                }]
                            },
                            callback: function(response) {
                                window.location.href = "<?php echo e(url('/invoice/paystack')); ?>/" +
                                    response.reference + "/<?php echo e(encrypt($invoice->id)); ?>";
                            },
                            onClose: function() {
                                alert('window closed');
                            }
                        });
                        handler.openIframe();
                    } else if (res.flag == 2) {} else {
                        show_toastr('Error', data.message, 'msg');
                    }
                }).submit();
            });
        </script>
    <?php endif; ?>

    <?php if($invoice->getDue() > 0 && isset($payment_detail['is_flutterwave_enabled']) && $payment_detail['is_flutterwave_enabled'] == 'on'): ?>

    <script src="https://api.ravepay.co/flwv3-pug/getpaidx/api/flwpbf-inline.js"></script>

    <script type="text/javascript">
        //    Flaterwave Payment
        $(document).on("click", "#pay_with_flaterwave", function() {

            $('#flaterwave-payment-form').ajaxForm(function(res) {

                if (res.flag == 1) {

                    var coupon_id = res.coupon;
                    var API_publicKey = '';
                    if ("<?php echo e($payment_detail['flutterwave_public_key']); ?>") {
                        API_publicKey = "<?php echo e($payment_detail['flutterwave_public_key']); ?>";
                    }
                    var nowTim = "<?php echo e(date('d-m-Y-h-i-a')); ?>";
                    var flutter_callback = "<?php echo e(url('/invoice-pay-with-flaterwave')); ?>";
                    var x = getpaidSetup({
                        PBFPubKey: API_publicKey,
                        customer_email: res.email,
                        amount: res.total_price,
                        currency: '<?php echo e($payment_detail['currency']); ?>',
                        txref: nowTim + '__' + Math.floor((Math.random() * 1000000000)) +
                            'fluttpay_online-' +
                            <?php echo e(date('Y-m-d')); ?>,
                        meta: [{
                            metaname: "payment_id",
                            metavalue: "id"
                        }],
                        onclose: function() {},
                        callback: function(response) {
                            var txref = response.tx.txRef;
                            if (response.tx.chargeResponseCode == "00" || response.tx
                                .chargeResponseCode == "0") {
                                window.location.href = "<?php echo e(url('/invoice/flaterwave')); ?>/" +
                                    txref + "/<?php echo e(encrypt($invoice->id)); ?>";
                            } else {
                                // redirect to a failure page.
                            }
                            x.close(); // use this to close the modal immediately after payment.
                        }
                    });
                } else if (res.flag == 2) {

                } else {
                    show_toastr('Error', data.message, 'msg');
                }

            }).submit();
        });
    </script>
    <?php endif; ?>

    <?php if($invoice->getDue() > 0 && isset($payment_detail['is_razorpay_enabled']) && $payment_detail['is_razorpay_enabled'] == 'on'): ?>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script type="text/javascript">
        // Razorpay Payment
        $(document).on("click", "#pay_with_razerpay", function() {
            $('#razorpay-payment-form').ajaxForm(function(res) {

                if (res.flag == 1) {
                    var razorPay_callback = "<?php echo e(url('/invoice-pay-with-razorpay')); ?>";
                    var totalAmount = res.total_price * 100;
                    var coupon_id = res.coupon;
                    var API_publicKey = '';
                    if ("<?php echo e($payment_detail['razorpay_public_key']); ?>") {
                        API_publicKey = "<?php echo e($payment_detail['razorpay_public_key']); ?>";
                    }
                    var options = {
                        "key": API_publicKey, // your Razorpay Key Id
                        "amount": totalAmount,
                        "name": 'Invoice Payment',
                        "currency": res.currency,
                        "description": "",
                        "handler": function(response) {
                            window.location.href = "<?php echo e(url('/invoice/razorpay')); ?>/" + response
                                .razorpay_payment_id + "/<?php echo e(encrypt($invoice->id)); ?>";
                        },
                        "theme": {
                            "color": "#528FF0"
                        }
                    };
                    var rzp1 = new Razorpay(options);
                    rzp1.open();
                } else if (res.flag == 2) {

                } else {
                    toastrs('Error', data.message, 'msg');
                }
            }).submit();
        });
    </script>
    <script>
        <?php if(isset(
            $payment_detail['is_payfast_enabled']) == 'on' &&
                !empty($payment_detail['payfast_merchant_id']) &&
                !empty($payment_detail['payfast_merchant_key'])): ?>

            $("#payfast_submit").click(function() {
                var amount = $('#payfast_amount').val();
                get_payfast_status(amount, form = true);
            });

            function get_payfast_status(amount, form) {
                var invoice_id = '<?php echo e($invoice->id); ?>';
                $.ajax({
                    url: '<?php echo e(route('invoice.with.payfast')); ?>',
                    method: 'POST',
                    data: {
                        'invoice_id': invoice_id,
                        'amount': amount,
                    },
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(data) {
                        if (data.success == true) {
                            $('#get-payfast-inputs').append(data.inputs);
                            $('.payfast_form').submit();
                        } else {
                            show_toastr('Error', data.inputs, 'error')
                        }
                    }
                });
            }
        <?php endif; ?>
    </script>
    <?php endif; ?>
<?php $__env->stopPush(); ?>

<?php echo $__env->make('layouts.invoicepayheader', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/invoices/invoicepay.blade.php ENDPATH**/ ?>