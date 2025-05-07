<?php $__env->startSection('title'); ?>
    <?php echo e(__('Buy Plan')); ?>

<?php $__env->stopSection(); ?>

<?php $__env->startPush('css'); ?>
    <style>
        #card-element {
            border: 1px solid #e4e6fc;
            border-radius: 5px;
            padding: 10px;
        }
    </style>
<?php $__env->stopPush(); ?>

<?php $__env->startSection('content'); ?>
    <div class="row">
        <div class="col-lg-4 order-lg-2">
            <div class="card">
                <div class="list-group list-group-flush" id="tabs">
                    <?php if(isset($paymentSetting['is_manually_enabled']) && $paymentSetting['is_manually_enabled'] == 'on'): ?>
                        <div data-href="#manually" class="list-group-item text-primary">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Manually')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_bank_tranfer_enabled']) && $paymentSetting['is_bank_tranfer_enabled'] == 'on'): ?>
                        <div data-href="#bank_transfer" class="list-group-item text-primary">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Bank Transfer')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['enable_stripe']) && $paymentSetting['enable_stripe'] == 'on'): ?>
                        <div data-href="#tabs-2" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Stripe')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['enable_paypal']) == 'on' && !empty($paymentSetting['paypal_client_id']) && !empty($paymentSetting['paypal_secret_key'])): ?>
                        <div data-href="#tabs-1" class="list-group-item text-primary">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Paypal')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_paystack_enabled']) && $paymentSetting['is_paystack_enabled'] == 'on'): ?>
                        <div data-href="#tabs-3" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Paystack')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_flutterwave_enabled']) && $paymentSetting['is_flutterwave_enabled'] == 'on'): ?>
                        <div data-href="#tabs-4" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Flutterwave')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_razorpay_enabled']) && $paymentSetting['is_razorpay_enabled'] == 'on'): ?>
                        <div data-href="#tabs-5" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Razorpay')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_paytm_enabled']) && $paymentSetting['is_paytm_enabled'] == 'on'): ?>
                        <div data-href="#tabs-6" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Paytm')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_mercado_enabled']) && $paymentSetting['is_mercado_enabled'] == 'on'): ?>
                        <div data-href="#tabs-7" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Mercado Pago')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_mollie_enabled']) && $paymentSetting['is_mollie_enabled'] == 'on'): ?>
                        <div data-href="#tabs-8" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Mollie')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_skrill_enabled']) && $paymentSetting['is_skrill_enabled'] == 'on'): ?>
                        <div data-href="#tabs-9" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Skrill')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_coingate_enabled']) && $paymentSetting['is_coingate_enabled'] == 'on'): ?>
                        <div data-href="#tabs-10" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Coingate')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_paymentwall_enabled']) && $paymentSetting['is_paymentwall_enabled'] == 'on'): ?>
                        <div data-href="#tabs-11" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('PaymentWall')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_toyyibpay_enabled']) && $paymentSetting['is_toyyibpay_enabled'] == 'on'): ?>
                        <div data-href="#tabs-12" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Toyyibpay')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_payfast_enabled']) && $paymentSetting['is_payfast_enabled'] == 'on'): ?>
                        <div data-href="#tabs-13" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Payfast')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_iyzipay_enabled']) && $paymentSetting['is_iyzipay_enabled'] == 'on'): ?>
                        <div data-href="#tabs-14" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Iyzipay')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_sspay_enabled']) && $paymentSetting['is_sspay_enabled'] == 'on'): ?>
                        <div data-href="#tabs-15" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('SSpay')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_paytab_enabled']) && $paymentSetting['is_paytab_enabled'] == 'on'): ?>
                        <div data-href="#tabs-16" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Paytab')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_benefit_enabled']) && $paymentSetting['is_benefit_enabled'] == 'on'): ?>
                        <div data-href="#tabs-17" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Benefit')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_cashfree_enabled']) && $paymentSetting['is_cashfree_enabled'] == 'on'): ?>
                        <div data-href="#tabs-18" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Cashfree')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_aamarpay_enabled']) && $paymentSetting['is_aamarpay_enabled'] == 'on'): ?>
                        <div data-href="#tabs-19" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Aamarpay')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_paytr_enabled']) && $paymentSetting['is_paytr_enabled'] == 'on'): ?>
                        <div data-href="#tabs-20" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('PayTR')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_yookassa_enabled']) && $paymentSetting['is_yookassa_enabled'] == 'on'): ?>
                        <div data-href="#tabs-21" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Yookassa')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_xendit_enabled']) && $paymentSetting['is_xendit_enabled'] == 'on'): ?>
                        <div data-href="#tabs-22" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Xendit')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_midtrans_enabled']) && $paymentSetting['is_midtrans_enabled'] == 'on'): ?>
                        <div data-href="#tabs-23" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Midtrans')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_fedapay_enabled']) && $paymentSetting['is_fedapay_enabled'] == 'on'): ?>
                        <div data-href="#tabs-24" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Fedapay')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_paiementpro_enabled']) && $paymentSetting['is_paiementpro_enabled'] == 'on'): ?>
                        <div data-href="#tabs-25" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Paiement Pro')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_nepalste_enabled']) && $paymentSetting['is_nepalste_enabled'] == 'on'): ?>
                        <div data-href="#tabs-26" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Nepalste')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_payhere_enabled']) && $paymentSetting['is_payhere_enabled'] == 'on'): ?>
                        <div data-href="#tabs-27" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('PayHere')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                    <?php if(isset($paymentSetting['is_cinetpay_enabled']) && $paymentSetting['is_cinetpay_enabled'] == 'on'): ?>
                        <div data-href="#tabs-28" class="list-group-item">
                            <div class="media">
                                <i class="fas fa-coins"></i>
                                <div class="media-body ml-3">
                                    <a href="#" class="stretched-link h6 mb-1"><?php echo e(__('Cinetpay')); ?></a>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <div class="col-lg-8 order-lg-1">

            <?php if(isset($paymentSetting['is_manually_enabled']) && $paymentSetting['is_manually_enabled'] == 'on'): ?>
                <div id="manually" class="tabs-card">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Manually')); ?></h5>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 py-2">
                                    <p><?php echo e(__('Requesting Manual Payment For The Planned Amount For The Subscriptions Plan.')); ?></p>
                                </div>
                            </div>
                            <div class="text-sm-right">
                                <?php if($plan->id != 1): ?>
                                    <div class="col-auto mb-2">
                                        <?php if(\Auth::user()->requested_plan != $plan->id): ?>
                                            <a href="#" class="btn btn-xs btn-primary btn-icon rounded-pill" data-url="<?php echo e(route('request.view',\Illuminate\Support\Facades\Crypt::encrypt($plan->id),)); ?>" data-ajax-popup="true" data-title="<?php echo e(__('Manually Request')); ?>">
                                                <span class="btn-inner--icon"><i class="fas fa-share"></i></span>
                                                <span class="btn-inner--text"><?php echo e(__('Manually Request')); ?></span>
                                            </a>
                                        <?php else: ?>
                                            <a href="<?php echo e(route('request.cancel',\Auth::user()->id)); ?>" class="btn btn-xs btn-primary btn-icon rounded-pill">
                                                <span class="btn-inner--icon"><i class="fas fa-times"></i></span>
                                                <span class="btn-inner--text"><?php echo e(__('Cancel Request')); ?></span>
                                            </a>
                                        <?php endif; ?>
                                    </div>
                                <?php endif; ?>
                            </div>

                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_bank_tranfer_enabled']) && $paymentSetting['is_bank_tranfer_enabled'] == 'on'): ?>
                <div id="bank_transfer" class="tabs-card">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Bank Transfer')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.banktransfer')); ?>" method="post"
                                class="require-validation" id="banktransfer-payment-form" enctype="multipart/form-data">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 banktransfer-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="banktransfer_payment_frequency"
                                                        class="payment_frequency" data-from="banktransfer" value="monthly"
                                                        data-price="<?php echo e((isset($payment_setting['currency']) ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e((isset($payment_setting['currency']) ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="banktransfer_payment_frequency"
                                                        class="payment_frequency" data-from="banktransfer" value="annual"
                                                        data-price="<?php echo e((isset($payment_setting['currency']) ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e((isset($payment_setting['currency']) ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                        <label class="form-label"><b><?php echo e(__('Bank Details:')); ?></b></label>
                                            <div class="form-group">
                                                <?php if( !empty($paymentSetting['bank_details'])): ?>
                                                    <?php echo $paymentSetting['bank_details']; ?>

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
                                            <div class="col-10">
                                                <div class="form-group">
                                                    <label for="banktransfer_coupon"
                                                        class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                    <input type="text" id="banktransfer_coupon" name="coupon"
                                                        class="form-control coupon" data-from="banktransfer"
                                                        placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group pt-4 mt-3">
                                                    <a href="javascript:void(0)"
                                                        class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                        data-from="banktransfer"><?php echo e(__('Apply')); ?></a>
                                                </div>
                                            </div>
                                            <div class="col-12 text-right banktransfer-coupon-tr" style="display: none">
                                                <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="banktransfer-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id" id="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="banktransfer-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['enable_paypal']) == 'on' && !empty($paymentSetting['paypal_client_id']) && !empty($paymentSetting['paypal_secret_key'])): ?>
                <div id="tabs-1" class="tabs-card">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Paypal')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.paypal')); ?>" method="post"
                                class="require-validation" id="paypal-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 paypal-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="paypal_payment_frequency"
                                                        class="payment_frequency" data-from="paypal" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="paypal_payment_frequency"
                                                        class="payment_frequency" data-from="paypal" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="paypal_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="paypal_coupon" name="coupon"
                                                    class="form-control coupon" data-from="paypal"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-4 mt-3">
                                                <a href="javascript:void(0)"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="paypal"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right paypal-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="paypal-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id" id="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="paypal-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['enable_stripe']) == 'on' && !empty($paymentSetting['stripe_key']) && !empty($paymentSetting['stripe_secret'])): ?>
                <div id="tabs-2" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Stripe')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('stripe.post')); ?>" method="post"
                                class="require-validation" id="stripe-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 stripe-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="stripe_payment_frequency"
                                                        class="payment_frequency" data-from="stripe" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="stripe_payment_frequency"
                                                        class="payment_frequency" data-from="stripe" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-12 pb-3 d-none">
                                            <div class="btn-group btn-group-toggle mt-1 w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="payment_type" id="one_time_type"
                                                        value="one-time" autocomplete="off" checked="">
                                                    <?php echo e(__('One Time')); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="payment_type" id="recurring_type"
                                                        value="recurring" autocomplete="off">
                                                    <?php echo e(__('Reccuring')); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="stripe_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="stripe_coupon" name="coupon"
                                                    class="form-control coupon" data-from="stripe"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-4 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="stripe"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right stripe-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="stripe-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">

                                            <input type="hidden" name="plan_id" id="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="stripe-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_paystack_enabled']) && $paymentSetting['is_paystack_enabled'] == 'on'): ?>
                <div id="tabs-3" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Paystack')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.paystack')); ?>" method="post"
                                class="require-validation" id="paystack-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 paystack-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="paystack_payment_frequency"
                                                        class="payment_frequency" data-from="paystack" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="paystack_payment_frequency"
                                                        class="payment_frequency" data-from="paystack" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="paystack_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="paystack_coupon" name="coupon"
                                                    class="form-control coupon" data-from="paystack"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="paystack"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right paystack-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="paystack-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="button"
                                                id="pay_with_paystack">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="paystack-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_flutterwave_enabled']) && $paymentSetting['is_flutterwave_enabled'] == 'on'): ?>
                <div id="tabs-4" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Flutterwave')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.flaterwave')); ?>" method="post"
                                class="require-validation" id="flaterwave-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 flutterwave-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="flaterwave_payment_frequency"
                                                        class="flaterwave_frequency" data-from="flaterwave"
                                                        value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="flaterwave_payment_frequency"
                                                        class="flaterwave_frequency" data-from="flaterwave"
                                                        value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="flaterwave_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="flaterwave_coupon" name="coupon"
                                                    class="form-control coupon" data-from="flaterwave"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="flaterwave"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right flaterwave-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="flaterwave-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="button"
                                                id="pay_with_flaterwave">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="flaterwave-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_razorpay_enabled']) && $paymentSetting['is_razorpay_enabled'] == 'on'): ?>
                <div id="tabs-5" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Razorpay')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.razorpay')); ?>" method="post"
                                class="require-validation" id="razorpay-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 razorpay-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="razorpay_payment_frequency"
                                                        class="payment_frequency" data-from="razorpay" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="razorpay_payment_frequency"
                                                        class="payment_frequency" data-from="razorpay" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="razorpay_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="razorpay_coupon" name="coupon"
                                                    class="form-control coupon" data-from="razorpay"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-4 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="razorpay"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right razorpay-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="razorpay-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id" id="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="button"
                                                id="pay_with_razorpay">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="razorpay-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_paytm_enabled']) && $paymentSetting['is_paytm_enabled'] == 'on'): ?>
                <div id="tabs-6" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Paytm')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.paytm')); ?>" method="post"
                                class="require-validation" id="paytm-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 paytm-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="paytm_payment_frequency"
                                                        class="paytm_frequency" data-from="paytm" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="paytm_payment_frequency"
                                                        class="paytm_frequency" data-from="paytm" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-11">
                                            <div class="form-group">
                                                <label for="flaterwave_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Mobile Number')); ?></label>
                                                <input type="text" id="mobile" name="mobile"
                                                    class="form-control mobile" data-from="mobile"
                                                    placeholder="<?php echo e(__('Enter Mobile Number')); ?>" required>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="flaterwave_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="paytm_coupon" name="coupon"
                                                    class="form-control coupon" data-from="paytm"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="paytm"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right paytm-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="paytm-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_paytm">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="paytm-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_mercado_enabled']) && $paymentSetting['is_mercado_enabled'] == 'on'): ?>
                <div id="tabs-7" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Mercado Pago')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.mercado')); ?>" method="post"
                                class="require-validation" id="mercado-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 mercado-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="mercado_payment_frequency"
                                                        class="mercado_frequency" data-from="mercado" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="mercado_payment_frequency"
                                                        class="mercado_frequency" data-from="mercado" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="mercado_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="mercado_coupon" name="coupon"
                                                    class="form-control coupon" data-from="mercado"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="mercado"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right mercado-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="mercado-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_mercado">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="mercado-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_mollie_enabled']) && $paymentSetting['is_mollie_enabled'] == 'on'): ?>
                <div id="tabs-8" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Mollie')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.mollie')); ?>" method="post"
                                class="require-validation" id="mollie-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 mercado-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="mollie_payment_frequency"
                                                        class="mollie_frequency" data-from="mollie" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="mollie_payment_frequency"
                                                        class="mollie_frequency" data-from="mollie" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="mollie_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="mollie_coupon" name="coupon"
                                                    class="form-control coupon" data-from="mollie"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="mollie"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right mollie-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="mollie-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_mollie">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="mollie-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_skrill_enabled']) && $paymentSetting['is_skrill_enabled'] == 'on'): ?>
                <div id="tabs-9" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Skrill')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.skrill')); ?>" method="post"
                                class="require-validation" id="skrill-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 skrill-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="skrill_payment_frequency"
                                                        class="skrill_frequency" data-from="skrill" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="skrill_payment_frequency"
                                                        class="skrill_frequency" data-from="skrill" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="skrill_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="skrill_coupon" name="coupon"
                                                    class="form-control coupon" data-from="skrill"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="skrill"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right skrill-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="skrill-coupon-price"></b>
                                        </div>
                                    </div>
                                    <?php
                                        $skrill_data = [
                                            'transaction_id' => md5(date('Y-m-d') . strtotime('Y-m-d H:i:s') . 'user_id'),
                                            'user_id' => 'user_id',
                                            'amount' => 'amount',
                                            'currency' => 'currency',
                                        ];
                                        session()->put('skrill_data', $skrill_data);

                                    ?>
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="error" style="display: none;">
                                                <div class='alert-danger alert'>
                                                    <?php echo e(__('Please correct the errors and try again.')); ?></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_skrill">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="skrill-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_coingate_enabled']) && $paymentSetting['is_coingate_enabled'] == 'on'): ?>
                <div id="tabs-10" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Coingate')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.coingate')); ?>" method="post"
                                class="require-validation" id="coingate-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 coingate-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="coingate_payment_frequency"
                                                        class="coingate_frequency" data-from="coingate" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="coingate_payment_frequency"
                                                        class="coingate_frequency" data-from="coingate" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="coingate_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="coingate_coupon" name="coupon"
                                                    class="form-control coupon" data-from="coingate"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="coingate"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right coingate-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="coingate-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_coingate">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="coingate-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_paymentwall_enabled']) && $paymentSetting['is_paymentwall_enabled'] == 'on'): ?>
                <div id="tabs-11" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using PaymentWall')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.paymentwallpayment')); ?>" method="post"
                                class="require-validation" id="paymentwall-payment-form">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 paymentwall-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="paymentwall_payment_frequency"
                                                        class="payment_frequency" data-from="paymentwall" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="paymentwall_payment_frequency"
                                                        class="payment_frequency" data-from="paymentwall" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="paymentwall_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="paymentwall_coupon" name="coupon"
                                                    class="form-control coupon" data-from="paymentwall"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="paymentwall"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right paymentwall-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="paymentwall-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_paymentwall">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="paymentwall-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_toyyibpay_enabled']) && $paymentSetting['is_toyyibpay_enabled'] == 'on'): ?>
                <div id="tabs-12" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Toyyibpay')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.toyyibpaypayment')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 toyyibpay-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="toyyibpay_payment_frequency"
                                                        class="payment_frequency" data-from="toyyibpay" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="toyyibpay_payment_frequency"
                                                        class="payment_frequency" data-from="toyyibpay" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="toyyibpay_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="toyyibpay_coupon" name="coupon"
                                                    class="form-control coupon" data-from="toyyibpay"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="toyyibpay"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right toyyibpay-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="toyyibpay-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_toyyibpay">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="toyyibpay-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_payfast_enabled']) && $paymentSetting['is_payfast_enabled'] == 'on' && !empty($paymentSetting['payfast_merchant_id']) && !empty($paymentSetting['payfast_merchant_key']) && !empty($paymentSetting['payfast_signature']) && !empty($paymentSetting['payfast_mode'])): ?>
                <div id="tabs-13" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Payfast')); ?></h5>
                        </div>
                        <div class="card-body">
                            <?php
                                $pfHost = $paymentSetting['payfast_mode'] == 'sandbox' ? 'sandbox.payfast.co.za' : 'www.payfast.co.za';
                            ?>
                            <form role="form" action="<?php echo e('https://' . $pfHost . '/eng/process'); ?> " method="post"
                                id="payfast-form" class="require-validation">

                                <?php echo csrf_field(); ?>
                                <div class="py-3 payfast-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="payfast_payment_frequency"
                                                        class="payfast_frequency" data-from="payfast" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="payfast_payment_frequency"
                                                        class="payfast_frequency" data-from="payfast" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="payfast_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="payfast_coupon" name="coupon" data-from="payfast"
                                                    class="form-control coupon"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="javascript:void(0)"  data-from="payfast"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right payfast-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="payfast-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id" id="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                                <div id="get-payfast-inputs"></div>
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_payfast">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="payfast-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_iyzipay_enabled']) && $paymentSetting['is_iyzipay_enabled'] == 'on'): ?>
                <div id="tabs-14" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Iyzipay')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('iyzipay.payment.init')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 iyzipay-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="iyzipay_payment_frequency"
                                                        class="payment_frequency" data-from="iyzipay" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="iyzipay_payment_frequency"
                                                        class="payment_frequency" data-from="iyzipay" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="iyzipay_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="iyzipay_coupon" name="coupon"
                                                    class="form-control coupon" data-from="iyzipay"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="iyzipay"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right iyzipay-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="iyzipay-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_iyzipay">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="iyzipay-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_sspay_enabled']) && $paymentSetting['is_sspay_enabled'] == 'on'): ?>
                <div id="tabs-15" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Sspay')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.sspaypayment')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 sspay-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="sspay_payment_frequency"
                                                        class="payment_frequency" data-from="sspay" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="sspay_payment_frequency"
                                                        class="payment_frequency" data-from="sspay" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="sspay_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="sspay_coupon" name="coupon"
                                                    class="form-control coupon" data-from="sspay"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="sspay"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right sspay-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="sspay-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_sspay">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="sspay-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_paytab_enabled']) && $paymentSetting['is_paytab_enabled'] == 'on'): ?>
                <div id="tabs-16" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Paytab')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.paytab')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 paytab-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="paytab_payment_frequency"
                                                        class="payment_frequency" data-from="paytab" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="paytab_payment_frequency"
                                                        class="payment_frequency" data-from="paytab" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="paytab_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="paytab_coupon" name="coupon"
                                                    class="form-control coupon" data-from="paytab"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="paytab"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right paytab-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="paytab-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_paytab">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="paytab-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_benefit_enabled']) && $paymentSetting['is_benefit_enabled'] == 'on'): ?>
                <div id="tabs-17" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Benefit')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.benefit')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 benefit-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="benefit_payment_frequency"
                                                        class="payment_frequency" data-from="benefit" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="benefit_payment_frequency"
                                                        class="payment_frequency" data-from="benefit" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="benefit_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="benefit_coupon" name="coupon"
                                                    class="form-control coupon" data-from="benefit"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="benefit"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right benefit-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="benefit-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_benefit">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="benefit-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_cashfree_enabled']) && $paymentSetting['is_cashfree_enabled'] == 'on'): ?>
                <div id="tabs-18" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Cashfree')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.cashfree')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 cashfree-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="cashfree_payment_frequency"
                                                        class="payment_frequency" data-from="cashfree" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="cashfree_payment_frequency"
                                                        class="payment_frequency" data-from="cashfree" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="cashfree_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="cashfree_coupon" name="coupon"
                                                    class="form-control coupon" data-from="cashfree"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="cashfree"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right cashfree-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="cashfree-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_cashfree">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="cashfree-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_aamarpay_enabled']) && $paymentSetting['is_aamarpay_enabled'] == 'on'): ?>
                <div id="tabs-19" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Aamarpay')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.aamarpay')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 aamarpay-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="aamarpay_payment_frequency"
                                                        class="payment_frequency" data-from="aamarpay" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="aamarpay_payment_frequency"
                                                        class="payment_frequency" data-from="aamarpay" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="aamarpay_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="aamarpay_coupon" name="coupon"
                                                    class="form-control coupon" data-from="aamarpay"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="aamarpay"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right aamarpay-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="aamarpay-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_aamarpay">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="aamarpay-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_paytr_enabled']) && $paymentSetting['is_paytr_enabled'] == 'on'): ?>
                <div id="tabs-20" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using PayTR')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.paytr')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 paytr-payment-div">
                                    <div class="row">

                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="paytr_payment_frequency"
                                                        class="payment_frequency" data-from="paytr" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="paytr_payment_frequency"
                                                        class="payment_frequency" data-from="paytr" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="paytr_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="paytr_coupon" name="coupon"
                                                    class="form-control coupon" data-from="paytr"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="paytr"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right paytr-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="paytr-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_paytr">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="paytr-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_yookassa_enabled']) && $paymentSetting['is_yookassa_enabled'] == 'on'): ?>
                <div id="tabs-21" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using YooKassa')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.pay.with.yookassa')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 yookassa-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="yookassa_payment_frequency"
                                                        class="payment_frequency" data-from="yookassa" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="yookassa_payment_frequency"
                                                        class="payment_frequency" data-from="yookassa" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="yookassa_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="yookassa_coupon" name="coupon"
                                                    class="form-control coupon" data-from="yookassa"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="yookassa"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right yookassa-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="yookassa-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_yookassa">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="yookassa-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_xendit_enabled']) && $paymentSetting['is_xendit_enabled'] == 'on'): ?>
                <div id="tabs-22" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Xendit')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.xendit.payment')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 xendit-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="xendit_payment_frequency"
                                                        class="payment_frequency" data-from="xendit" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="xendit_payment_frequency"
                                                        class="payment_frequency" data-from="xendit" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="xendit_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="xendit_coupon" name="coupon"
                                                    class="form-control coupon" data-from="xendit"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="xendit"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right xendit-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="xendit-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_xendit">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="xendit-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_midtrans_enabled']) && $paymentSetting['is_midtrans_enabled'] == 'on'): ?>
                <div id="tabs-23" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Midtrans')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.get.midtrans')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 midtrans-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="midtrans_payment_frequency"
                                                        class="payment_frequency" data-from="midtrans" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="midtrans_payment_frequency"
                                                        class="payment_frequency" data-from="midtrans" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="midtrans_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="midtrans_coupon" name="coupon"
                                                    class="form-control coupon" data-from="midtrans"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="midtrans"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right midtrans-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="midtrans-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_midtrans">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="midtrans-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_fedapay_enabled']) && $paymentSetting['is_fedapay_enabled'] == 'on'): ?>
                <div id="tabs-24" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Fedapay')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.get.fedapay')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 fedapay-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="fedapay_payment_frequency"
                                                        class="payment_frequency" data-from="fedapay" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="fedapay_payment_frequency"
                                                        class="payment_frequency" data-from="fedapay" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="fedapay_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="fedapay_coupon" name="coupon"
                                                    class="form-control coupon" data-from="fedapay"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="fedapay"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right fedapay-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="fedapay-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_fedapay">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="fedapay-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_paiementpro_enabled']) && $paymentSetting['is_paiementpro_enabled'] == 'on'): ?>
                <div id="tabs-25" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Paiement Pro')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.get.paiementpro')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 paiementpro-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="paiementpro_payment_frequency"
                                                        class="payment_frequency" data-from="paiementpro" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="paiementpro_payment_frequency"
                                                        class="payment_frequency" data-from="paiementpro" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="paiementpro_mobile_number"
                                                    class="form-control-label text-dark"><?php echo e(__('Mobile Number')); ?></label>
                                                <input type="text" id="paiementpro_mobile_number" name="mobile_number"
                                                    class="form-control mobile_number" data-from="paiementpro"
                                                    placeholder="<?php echo e(__('Enter Mobile Number')); ?>">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="paiementpro_channel"
                                                    class="form-control-label text-dark"><?php echo e(__('Channel')); ?></label>
                                                <input type="text" id="paiementpro_channel" name="channel"
                                                    class="form-control channel" data-from="paiementpro"
                                                    placeholder="<?php echo e(__('Enter Channel')); ?>">
                                                    <small class="text-danger">Example : OMCIV2 , MOMO , CARD , FLOOZ , PAYPAL</small>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="paiementpro_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="paiementpro_coupon" name="coupon"
                                                    class="form-control coupon" data-from="paiementpro"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="paiementpro"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right paiementpro-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="paiementpro-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_paiementpro">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="paiementpro-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_nepalste_enabled']) && $paymentSetting['is_nepalste_enabled'] == 'on'): ?>
                <div id="tabs-26" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Nepalste')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.get.nepalste')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 nepalste-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="nepalste_payment_frequency"
                                                        class="payment_frequency" data-from="nepalste" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="nepalste_payment_frequency"
                                                        class="payment_frequency" data-from="nepalste" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="nepalste_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="nepalste_coupon" name="coupon"
                                                    class="form-control coupon" data-from="nepalste"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="nepalste"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right nepalste-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="nepalste-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_nepalste">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="nepalste-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_payhere_enabled']) && $paymentSetting['is_payhere_enabled'] == 'on'): ?>
                <div id="tabs-27" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using PayHere')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.get.payhere')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 payhere-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="payhere_payment_frequency"
                                                        class="payment_frequency" data-from="payhere" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="payhere_payment_frequency"
                                                        class="payment_frequency" data-from="payhere" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="payhere_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="payhere_coupon" name="coupon"
                                                    class="form-control coupon" data-from="payhere"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="payhere"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right payhere-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="payhere-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_payhere">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="payhere-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

            <?php if(isset($paymentSetting['is_cinetpay_enabled']) && $paymentSetting['is_cinetpay_enabled'] == 'on'): ?>
                <div id="tabs-28" class="tabs-card d-none">
                    <div class="card">
                        <div class="card-header">
                            <h5 class=" h6 mb-0"><?php echo e(__('Pay Using Cinetpay')); ?></h5>
                        </div>
                        <div class="card-body">
                            <form role="form" action="<?php echo e(route('plan.get.cinetpay')); ?>" method="post"
                                class="require-validation">
                                <?php echo csrf_field(); ?>
                                <div class="py-3 cinetpay-payment-div">
                                    <div class="row">
                                        <div class="col-12 pb-3">
                                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                                <label class="btn btn-sm btn-primary active">
                                                    <input type="radio" name="cinetpay_payment_frequency"
                                                        class="payment_frequency" data-from="cinetpay" value="monthly"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>"
                                                        autocomplete="off"
                                                        checked=""><?php echo e(__('Monthly Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?>

                                                </label>
                                                <label class="btn btn-sm btn-primary">
                                                    <input type="radio" name="cinetpay_payment_frequency"
                                                        class="payment_frequency" data-from="cinetpay" value="annual"
                                                        data-price="<?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>"
                                                        autocomplete="off"><?php echo e(__('Annual Payments')); ?><br>
                                                    <?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->annual_price); ?>

                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-10">
                                            <div class="form-group">
                                                <label for="cinetpay_coupon"
                                                    class="form-control-label text-dark"><?php echo e(__('Coupon')); ?></label>
                                                <input type="text" id="cinetpay_coupon" name="coupon"
                                                    class="form-control coupon" data-from="cinetpay"
                                                    placeholder="<?php echo e(__('Enter Coupon Code')); ?>">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group pt-3 mt-3">
                                                <a href="#"
                                                    class="btn btn-primary btn-sm my-auto text-white apply-coupon"
                                                    data-from="cinetpay"><?php echo e(__('Apply')); ?></a>
                                            </div>
                                        </div>
                                        <div class="col-12 text-right cinetpay-coupon-tr" style="display: none">
                                            <b><?php echo e(__('Coupon Discount')); ?></b> : <b class="cinetpay-coupon-price"></b>
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
                                <div class="row mt-3">
                                    <div class="col-sm-12">
                                        <div class="text-sm-right">
                                            <input type="hidden" name="plan_id"
                                                value="<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>">
                                            <button class="btn btn-primary btn-sm rounded-pill" type="submit"
                                                id="pay_with_cinetpay">
                                                <i class="mdi mdi-cash-multiple mr-1"></i> <?php echo e(__('Pay Now')); ?> (<span
                                                    class="cinetpay-final-price"><?php echo e(($paymentSetting['currency'] ? $paymentSetting['currency'] : '$') . $plan->monthly_price); ?></span>)
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <?php endif; ?>

        </div>
    </div>

<?php $__env->stopSection(); ?>
<?php $__env->startPush('script'); ?>
    <script src="<?php echo e(url('assets/js/jquery.form.js')); ?>"></script>
    <script src="https://js.paystack.co/v1/inline.js"></script>
    <script src="https://api.ravepay.co/flwv3-pug/getpaidx/api/flwpbf-inline.js"></script>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

    <?php if(
        isset($paymentSetting['enable_stripe']) == 'on' &&
            !empty($paymentSetting['stripe_key']) &&
            !empty($paymentSetting['stripe_secret'])): ?>
        <?php $stripe_session = Session::get('stripe_session'); ?>
        <?php if(isset($stripe_session) && $stripe_session): ?>
        <script src="https://js.stripe.com/v3/"></script>
        <script>
            var stripe = Stripe('<?php echo e($paymentSetting['stripe_key']); ?>');
            stripe.redirectToCheckout({
                sessionId: '<?php echo e($stripe_session->id); ?>',
            }).then((result) => {});
        </script>
        <?php endif ?>
    <?php endif; ?>

    <script>
        $(document).ready(function() {
            setTimeout(function() {
                $('.list-group .list-group-item').first().trigger('click');
            }, 100);

            $('.list-group-item').on('click', function() {
                var href = $(this).attr('data-href');
                $('.tabs-card').addClass('d-none');
                $(href).removeClass('d-none');
                $('#tabs .list-group-item').removeClass('text-primary');
                $(this).addClass('text-primary');
            });

            $('.payment_frequency:first').trigger('change');
        });

        $(document).on('change', '.payment_frequency', function(e) {
            var price = $(this).attr('data-price');
            var where = $(this).attr('data-from');
            $('.' + where + '-final-price').text(price);

            if ($('#' + where + '_coupon').val() != null && $('#' + where + '_coupon').val() != '') {
                applyCoupon($('#' + where + '_coupon').val(), where);
            }
        });

        $(document).on('click', '.apply-coupon', function(e) {
            e.preventDefault();
            var where = $(this).attr('data-from');
            applyCoupon($('#' + where + '_coupon').val(), where);
        })


        // Paystack Payment
        // if (!empty($paymentSetting['is_paystack_enabled']) && isset($paymentSetting['is_paystack_enabled']) && $paymentSetting['is_paystack_enabled'] == 'on')
            $(document).on("click", "#pay_with_paystack", function()
            {
                $('#paystack-payment-form').ajaxForm(function(res) {
                    if (res.flag == 1) {
                        var coupon_id = res.coupon;

                        var paystack_callback = "<?php echo e(url('/plan/paystack')); ?>";
                        var order_id = '<?php echo e(time()); ?>';
                        var handler = PaystackPop.setup({
                            key: '<?php echo e($paymentSetting['paystack_public_key']); ?>',
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
                                console.log(response.reference, order_id);
                                window.location.href = paystack_callback + '/' + response
                                    .reference + '/' + '<?php echo e(encrypt($plan->id)); ?>' +
                                    '?coupon_id=' + coupon_id + '&payment_frequency=' + res
                                    .payment_frequency
                            },
                            onClose: function() {
                                alert('window closed');
                            }
                        });
                        handler.openIframe();
                    } else if (res.flag == 2) {

                    } else {
                        show_toastr('Error', data.message, 'msg');
                    }

                }).submit();
            });
        // endif

        // Flaterwave Payment
        $(document).on("click", "#pay_with_flaterwave", function() {
            $('#flaterwave-payment-form').ajaxForm(function(res) {
                if (res.flag == 1) {
                    var coupon_id = res.coupon;

                    var API_publicKey = '<?php echo e($paymentSetting['flutterwave_public_key']); ?>';
                    var nowTim = "<?php echo e(date('d-m-Y-h-i-a')); ?>";

                    var flutter_callback = "<?php echo e(url('/plan/flaterwave')); ?>";
                    var x = getpaidSetup({
                        PBFPubKey: API_publicKey,
                        customer_email: '<?php echo e(Auth::user()->email); ?>',
                        amount: res.total_price,
                        currency: res.currency,
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
                            if (
                                response.tx.chargeResponseCode == "00" ||
                                response.tx.chargeResponseCode == "0"
                            ) {
                                window.location.href = flutter_callback + '/' + txref + '/' +
                                    '<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>?coupon_id=' +
                                    coupon_id + '&payment_frequency=' + res.payment_frequency;
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

        <?php if(isset($paymentSetting['razorpay_public_key'])): ?>
            $(document).on("click", "#pay_with_razorpay", function () {
                $('#razorpay-payment-form').ajaxForm(function (res) {
                    if (res.flag == 1) {
                        var amount = res.total_price;
                        var razorPay_callback = '<?php echo e(url('/plan/razorpay')); ?>';
                        var totalAmount = res.total_price * 100;
                        var coupon_id = res.coupon;
                        var options = {
                            "key": "<?php echo e($paymentSetting['razorpay_public_key']); ?>", // your Razorpay Key Id
                            "amount": totalAmount,
                            "name": 'Plan',
                            "currency": '<?php echo e(App\Models\Utility::getValByName('site_currency')); ?>',
                            "description": "",
                            "handler": function (response) {
                                window.location.href = razorPay_callback + '/' + response.razorpay_payment_id + '/' +
                                '<?php echo e(\Illuminate\Support\Facades\Crypt::encrypt($plan->id)); ?>?coupon_id=' +
                                    coupon_id + '&payment_frequency=' + res.payment_frequency;
                            },
                            "theme": {
                                "color": "#528FF0"
                            }
                        };
                        var rzp1 = new Razorpay(options);
                        rzp1.open();
                    } else if (res.flag == 2) {
                        toastrs('Error', res.msg, 'msg');
                    } else {ppaymenr
                        toastrs('Error', data.message, 'msg');
                    }

                }).submit();
            });
        <?php endif; ?>

        function applyCoupon(coupon_code, where) {
            if (coupon_code != null && coupon_code != '') {
                var frequency = $('input[name="' + where + '_payment_frequency"]:checked').val()
                $.ajax({
                    url: '<?php echo e(route('apply.coupon')); ?>',
                    datType: 'json',
                    data: {
                        plan_id: '<?php echo e($plan->id); ?>',
                        coupon: coupon_code,
                        frequency: frequency
                        // alert(frequency);
                    },
                    success: function (data) {
                        if (data.is_success) {

                            if(where == 'payfast')
                            {
                                get_payfast_status(data.price, coupon_code,frequency);
                            }
                            else
                            {
                                $('.' + where + '-coupon-tr').show().find('.' + where + '-coupon-price').text(data.discount_price);
                                $('.' + where + '-final-price').text(data.final_price);
                                // show_toastr('Success', data.message, 'success');
                            }

                        } else {
                            $('.' + where + '-coupon-tr').hide().find('.' + where + '-coupon-price').text('');
                            $('.' + where + '-final-price').text(data.final_price);
                            show_toastr('Error', data.message, 'error');
                        }
                    }
                })
            } else {
                show_toastr('Error', '<?php echo e(__('Please Enter Coupon Code.')); ?>', 'error');
                $('.' + where + '-coupon-tr').hide().find('.' + where + '-coupon-price').text('');
                var price = $('input[name="' + where + '_payment_frequency"]:checked').attr('data-price');
                $('.' + where + '-final-price').text(price);
            }
        }



            <?php if( isset($paymentSetting['is_payfast_enabled']) &&
                $paymentSetting['is_payfast_enabled'] == 'on' &&
                !empty($paymentSetting['payfast_merchant_id']) &&
                !empty($paymentSetting['payfast_merchant_key'])): ?>
            $(document).ready(function() {
                var frequency = $('.payfast_frequency').val();
                // alert(frequency);
                get_payfast_status(amount = 0, coupon = null,frequency);

            })

            $('.payfast_frequency').on('change',function(){
                var frequency = $(this).val();
                get_payfast_status(amount = 0, coupon = null,frequency);

            })
            function get_payfast_status(amount, coupon,frequency) {

                var plan_id = $('#plan_id').val();
                // var frequency = $('input[name=payfast_payment_frequency]:checked', '.payfast-form').val();
                // alert(frequency);


                $.ajax({
                    url: '<?php echo e(route('payfast.payment')); ?>',
                    method: 'POST',
                    data: {
                        'plan_id': plan_id,
                        'coupon_amount': amount,
                        'coupon_code': coupon,
                        'frequency': frequency,
                    },
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(data) {

                        if (data.success == true) {
                            $('#get-payfast-inputs').append(data.inputs);

                        } else {
                            show_toastr('Error', data.inputs, 'error')
                        }
                    }
                });
            }
        <?php endif; ?>
</script>

<?php $__env->stopPush(); ?>




<?php echo $__env->make('layouts.admin', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/plans/payment.blade.php ENDPATH**/ ?>