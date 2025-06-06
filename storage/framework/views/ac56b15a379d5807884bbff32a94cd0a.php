<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>" <?php echo e((\App\Models\Utility::getValByName('enable_rtl') == 'on') ? 'dir="rtl"' : ''); ?>>
<head>
    <?php if(\App\Models\Utility::getValByName('enable_rtl') == 'on'): ?>
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/bootstrap-rtl.css')); ?>">
    <?php endif; ?>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Lato&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('css/app.css')); ?>">
    <style type="text/css">.resize-observer[data-v-b329ee4c] {
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
            width: 100%;
            height: 100%;
            border: none;
            background-color: transparent;
            pointer-events: none;
            display: block;
            overflow: hidden;
            opacity: 0
        }

        .resize-observer[data-v-b329ee4c] object {
            display: block;
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            overflow: hidden;
            pointer-events: none;
            z-index: -1
        }</style>
    <style type="text/css">p[data-v-f2a183a6] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-f2a183a6] {
            margin: 0;
        }

        .d-table[data-v-f2a183a6] {
            margin-top: 20px;
        }

        .d-table-footer[data-v-f2a183a6] {
            display: -webkit-box;
            display: flex;
        }

        .d-table-controls[data-v-f2a183a6] {
            -webkit-box-flex: 2;
            flex: 2;
        }

        .d-table-summary[data-v-f2a183a6] {
            -webkit-box-flex: 1;
            flex: 1;
        }

        .d-table-summary-item[data-v-f2a183a6] {
            width: 100%;
            display: -webkit-box;
            display: flex;
        }

        .d-table-label[data-v-f2a183a6] {
            -webkit-box-flex: 1;
            flex: 1;
            display: -webkit-box;
            display: flex;
            -webkit-box-pack: end;
            justify-content: flex-end;
            padding-top: 9px;
            padding-bottom: 9px;
        }

        .d-table-label .form-input[data-v-f2a183a6] {
            margin-left: 10px;
            width: 80px;
            height: 24px;
        }

        .d-table-label .form-input-mask-text[data-v-f2a183a6] {
            top: 3px;
        }

        .d-table-value[data-v-f2a183a6] {
            -webkit-box-flex: 1;
            flex: 1;
            text-align: right;
            padding-top: 9px;
            padding-bottom: 9px;
            padding-right: 10px;
        }

        .d-table-spacer[data-v-f2a183a6] {
            margin-top: 5px;
        }

        .d-table-tr[data-v-f2a183a6] {
            display: -webkit-box;
            display: flex;
            flex-wrap: wrap;
        }

        .d-table-td[data-v-f2a183a6] {
            padding: 10px 10px 10px 10px;
        }

        .d-table-th[data-v-f2a183a6] {
            padding: 10px 10px 10px 10px;
            font-weight: bold;
        }

        .d-body[data-v-f2a183a6] {
            padding: 50px;
        }

        .d[data-v-f2a183a6] {
            font-size: 0.9em !important;
            color: black;
            background: white;
            min-height: 1000px;
        }

        .d-right[data-v-f2a183a6] {
            text-align: right;
        }

        .d-title[data-v-f2a183a6] {
            font-size: 50px;
            line-height: 50px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .d-header-50[data-v-f2a183a6] {
            -webkit-box-flex: 1;
            flex: 1;
        }

        .d-header-inner[data-v-f2a183a6] {
            display: -webkit-box;
            display: flex;
            padding: 50px;
        }

        .d-header-brand[data-v-f2a183a6] {
            width: 200px;
        }

        .d-logo[data-v-f2a183a6] {
            max-width: 100%;
        }</style>
    <style type="text/css">p[data-v-37eeda86] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-37eeda86] {
            margin: 0;
        }

        img[data-v-37eeda86] {
            max-width: 100%;
        }

        .d-table-value[data-v-37eeda86] {
            padding-right: 0;
        }

        .d-table-controls[data-v-37eeda86] {
            -webkit-box-flex: 5;
            flex: 5;
        }

        .d-table-summary[data-v-37eeda86] {
            -webkit-box-flex: 4;
            flex: 4;
        }</style>
    <style type="text/css">p[data-v-e95a8a8c] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-e95a8a8c] {
            margin: 0;
        }

        img[data-v-e95a8a8c] {
            max-width: 100%;
        }

        .d[data-v-e95a8a8c] {
            font-family: monospace;
        }

        .fancy-title[data-v-e95a8a8c] {
            margin-top: 0;
            padding-top: 0;
        }

        .d-table-value[data-v-e95a8a8c] {
            padding-right: 0;
        }

        .d-table-controls[data-v-e95a8a8c] {
            -webkit-box-flex: 5;
            flex: 5;
        }

        .d-table-summary[data-v-e95a8a8c] {
            -webkit-box-flex: 4;
            flex: 4;
        }</style>
    <style type="text/css">p[data-v-363339a0] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-363339a0] {
            margin: 0;
        }

        img[data-v-363339a0] {
            max-width: 100%;
        }

        .fancy-title[data-v-363339a0] {
            margin-top: 0;
            font-size: 30px;
            line-height: 1.2em;
            padding-top: 0;
        }

        .f-b[data-v-363339a0] {
            font-size: 17px;
            line-height: 1.2em;
        }

        .thank[data-v-363339a0] {
            font-size: 45px;
            line-height: 1.2em;
            text-align: right;
            font-style: italic;
            padding-right: 25px;
        }

        .f-remarks[data-v-363339a0] {
            padding-left: 25px;
        }

        .d-table-value[data-v-363339a0] {
            padding-right: 0;
        }

        .d-table-controls[data-v-363339a0] {
            -webkit-box-flex: 5;
            flex: 5;
        }

        .d-table-summary[data-v-363339a0] {
            -webkit-box-flex: 4;
            flex: 4;
        }</style>
    <style type="text/css">p[data-v-e23d9750] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-e23d9750] {
            margin: 0;
        }

        img[data-v-e23d9750] {
            max-width: 100%;
        }

        .fancy-title[data-v-e23d9750] {
            margin-top: 0;
            font-size: 40px;
            line-height: 1.2em;
            font-weight: bold;
            padding: 25px;
            margin-right: 25px;
        }

        .f-b[data-v-e23d9750] {
            font-size: 17px;
            line-height: 1.2em;
        }

        .thank[data-v-e23d9750] {
            font-size: 45px;
            line-height: 1.2em;
            text-align: right;
            font-style: italic;
            padding-right: 25px;
        }

        .f-remarks[data-v-e23d9750] {
            padding: 25px;
        }

        .d-table-value[data-v-e23d9750] {
            padding-right: 0;
        }

        .d-table-controls[data-v-e23d9750] {
            -webkit-box-flex: 5;
            flex: 5;
        }

        .d-table-summary[data-v-e23d9750] {
            -webkit-box-flex: 4;
            flex: 4;
        }</style>
    <style type="text/css">p[data-v-4b3dcb8a] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-4b3dcb8a] {
            margin: 0;
        }

        img[data-v-4b3dcb8a] {
            max-width: 100%;
        }

        .fancy-title[data-v-4b3dcb8a] {
            margin-top: 0;
            padding-top: 0;
        }

        .sub-title[data-v-4b3dcb8a] {
            margin: 5px 0 3px 0;
            display: block;
        }

        .d-table-value[data-v-4b3dcb8a] {
            padding-right: 0;
        }

        .d-table-controls[data-v-4b3dcb8a] {
            -webkit-box-flex: 5;
            flex: 5;
        }

        .d-table-summary[data-v-4b3dcb8a] {
            -webkit-box-flex: 4;
            flex: 4;
        }</style>
    <style type="text/css">p[data-v-1ad6e3b9] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-1ad6e3b9] {
            margin: 0;
        }

        img[data-v-1ad6e3b9] {
            max-width: 100%;
        }

        .fancy-title[data-v-1ad6e3b9] {
            margin-top: 0;
            padding-top: 0;
        }

        .sub-title[data-v-1ad6e3b9] {
            margin: 5px 0 3px 0;
            display: block;
        }

        .d-no-pad[data-v-1ad6e3b9] {
            padding: 0px;
        }

        .grey-box[data-v-1ad6e3b9] {
            padding: 50px;
            background: #f8f8f8;
        }

        .d-inner-2[data-v-1ad6e3b9] {
            padding: 50px;
        }</style>
    <style type="text/css">p[data-v-136bf9b5] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-136bf9b5] {
            margin: 0;
        }

        img[data-v-136bf9b5] {
            max-width: 100%;
        }

        .fancy-title[data-v-136bf9b5] {
            margin-top: 0;
            padding-top: 0;
        }

        .d-table-value[data-v-136bf9b5] {
            padding-right: 0px;
        }</style>
    <style type="text/css">p[data-v-7d9d14b5] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-7d9d14b5] {
            margin: 0;
        }

        img[data-v-7d9d14b5] {
            max-width: 100%;
        }

        .fancy-title[data-v-7d9d14b5] {
            margin-top: 0;
            padding-top: 0;
        }

        .sub-title[data-v-7d9d14b5] {
            margin: 0 0 5px 0;
        }

        .padd[data-v-7d9d14b5] {
            margin-left: 5px;
            padding-left: 5px;
            border-left: 1px solid #f8f8f8;
            margin-right: 5px;
            padding-right: 5px;
            border-right: 1px solid #f8f8f8;
        }

        .d-inner[data-v-7d9d14b5] {
            padding-right: 0px;
        }

        .d-table-value[data-v-7d9d14b5] {
            padding-right: 5px;
        }

        .d-table-controls[data-v-7d9d14b5] {
            -webkit-box-flex: 5;
            flex: 5;
        }

        .d-table-summary[data-v-7d9d14b5] {
            -webkit-box-flex: 4;
            flex: 4;
        }</style>
    <style type="text/css">p[data-v-b8f60a0c] {
            line-height: 1.2em;
            margin: 0 0 2px 0;
        }

        pre[data-v-b8f60a0c] {
            margin: 0;
        }

        img[data-v-b8f60a0c] {
            max-width: 100%;
        }

        .fancy-title[data-v-b8f60a0c] {
            margin-top: 0;
            padding-top: 10px;
        }

        .d-table-value[data-v-b8f60a0c] {
            padding-right: 0;
        }

        .d-table-controls[data-v-b8f60a0c] {
            -webkit-box-flex: 5;
            flex: 5;
        }

        .d-table-summary[data-v-b8f60a0c] {
            -webkit-box-flex: 4;
            flex: 4;
        }

        .overflow-x-hidden {
            /*overflow-x: hidden !important;*/
            zoom: 90%;
        }
    </style>
</head>
<body class="overflow-x-hidden">
<div class="container">
    <div id="app">
        <div class="editor">
            <div class="invoice-preview-inner">
                <div class="editor-content">
                    <div class="preview-main client-preview">
                        <div data-v-e23d9750="" class="d" style="width:800px;margin-left: auto;margin-right: auto;" id="boxes">
                            <div data-v-e23d9750="" class="d-inner">
                                <div data-v-e23d9750="" class="row">
                                    <div data-v-e23d9750="" class="col-66"><h1 data-v-e23d9750="" class="fancy-title tu mb5" style="background: <?php echo e($color); ?>;color: <?php echo e($font_color); ?>"><?php echo e(__('INVOICE')); ?></h1></div>
                                    <div data-v-e23d9750="" class="col-33">
                                        <img data-v-e23d9750="" src="<?php echo e($img); ?>" class="d-logo">
                                        <div data-v-e23d9750="" class="break-25"></div>
                                        <p data-v-e23d9750=""><?php if($invoice_usr->name): ?><?php echo e($invoice_usr->name); ?><?php endif; ?></p>
                                        <pre data-v-e23d9750=""><?php if($left_address['address']): ?><?php echo e($left_address['address']); ?><?php endif; ?></pre>
                                        <p data-v-e23d9750=""><?php if($left_address['city']): ?> <?php echo e($left_address['city']); ?>, <?php endif; ?> <?php if($left_address['state']): ?><?php echo e($left_address['state']); ?><?php endif; ?> <?php if($left_address['zipcode']): ?> - <?php echo e($left_address['zipcode']); ?><?php endif; ?></p>
                                        <p data-v-e23d9750=""><?php if($left_address['country']): ?><?php echo e($left_address['country']); ?><?php endif; ?></p>
                                    </div>
                                </div>
                                <div data-v-e23d9750="" class="break-50"></div>
                                <div data-v-e23d9750="" class="row">
                                    <div data-v-e23d9750="" class="col-66"><strong data-v-e23d9750="" class="tu mb5"><?php echo e(__('Bill To')); ?>:</strong>
                                        <p data-v-e23d9750=""><?php if($invoice->client_id == $invoice_usr->id): ?>
                                                <?php echo e($invoice->user->name); ?>

                                            <?php else: ?>
                                                <?php echo e($invoice->client->name); ?>

                                            <?php endif; ?></p>
                                        <pre data-v-e23d9750=""><?php if($right_address['address']): ?><?php echo e($right_address['address']); ?><?php endif; ?></pre>
                                        <p data-v-e23d9750=""><?php if($right_address['city']): ?> <?php echo e($right_address['city']); ?>, <?php endif; ?> <?php if($right_address['state']): ?><?php echo e($right_address['state']); ?><?php endif; ?> <?php if($right_address['zipcode']): ?> - <?php echo e($right_address['zipcode']); ?><?php endif; ?></p>
                                        <p data-v-e23d9750=""><?php if($right_address['country']): ?><?php echo e($right_address['country']); ?><?php endif; ?></p>
                                    </div>
                                    <div data-v-e23d9750="" class="col-33">
                                        <table data-v-e23d9750="" class="summary-table">
                                            <tbody data-v-e23d9750="" style="position: relative">
                                            <tr data-v-e23d9750="">
                                                <td data-v-e23d9750="" class="tu fwb"><?php echo e(__('Number')); ?>:</td>
                                                <td data-v-e23d9750="" class="text-right"><?php echo e(\App\Models\Utility::invoiceNumberFormat($invoice->invoice_id)); ?></td>
                                            </tr>
                                            <tr data-v-e23d9750="">
                                                <td data-v-e23d9750="" class="tu fwb"><?php echo e(__('Project')); ?>:</td>
                                                <td data-v-e23d9750="" class="text-right"><?php echo e($invoice->project->title); ?></td>
                                            </tr>
                                            <tr data-v-e23d9750="">
                                                <td data-v-e23d9750="" class="tu fwb"><?php echo e(__('Due Date')); ?>:</td>
                                                <td data-v-e23d9750="" class="text-right"><?php echo e(\Utility::getDateFormated($invoice->due_date)); ?></td>
                                            </tr>
                                            <tr class="col-lg-6 col-md-6 text-align-right ml-10" style="left: -356px; padding-top: 10px;">
                                                <td class="">
                                                    <p>
                                                        <?php echo DNS2D::getBarcodeHTML(route('pay.invoice',\Illuminate\Support\Facades\Crypt::encrypt($invoice->id)), "QRCODE",2,2); ?>

                                                    </p>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div data-v-e23d9750="" class="break-25"></div>
                                <div data-v-e23d9750="" class="d-table">
                                    <div data-v-e23d9750="" class="d-table">
                                        <div data-v-e23d9750="" class="tu d-table-tr" style="border-bottom: 2px solid <?php echo e($color); ?>;">
                                            <div data-v-e23d9750="" class="d-table-th w-2"><?php echo e(__('#')); ?></div>
                                            <div data-v-e23d9750="" class="d-table-th w-13"><?php echo e(__('Item description')); ?></div>
                                            <div data-v-e23d9750="" class="d-table-th w-5"><?php echo e(__('Price')); ?></div>
                                            <div data-v-e23d9750="" class="d-table-th w-3 text-right"><?php echo e(__('Tax')); ?></div>
                                        </div>
                                        <div data-v-e23d9750="" class="d-table-body" style="border-bottom: 2px solid <?php echo e($color); ?>;">
                                            <?php if(isset($invoice->items) && count($invoice->items) > 0): ?>
                                                <?php $__currentLoopData = $invoice->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <div data-v-e23d9750="" class="d-table-tr">
                                                        <div data-v-e23d9750="" class="d-table-td w-2"><span><?php echo e($key+1); ?></span></div>
                                                        <div data-v-e23d9750="" class="d-table-td w-13">
                                                            <pre data-v-e23d9750=""><?php echo e($item->item); ?><br data-v-e23d9750=""></pre>
                                                        </div>
                                                        <div data-v-e23d9750="" class="d-table-td w-5"><span data-v-e23d9750=""><?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,$item->price,true)); ?></span></div>
                                                        <div data-v-e23d9750="" class="d-table-td w-3 text-right"><span data-v-e23d9750=""><?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,$item->tax(),true)); ?></span></div>
                                                    </div>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                            <?php else: ?>
                                                <div data-v-e23d9750="" class="d-table-tr">
                                                    <div data-v-e23d9750="" class="d-table-td w-2"><span data-v-e23d9750="">-</span></div>
                                                    <div data-v-e23d9750="" class="d-table-td w-13">
                                                        <pre data-v-e23d9750="">-<br data-v-e23d9750=""></pre>
                                                    </div>
                                                    <div data-v-e23d9750="" class="d-table-td w-5"><span data-v-e23d9750="">-</span></div>
                                                    <div data-v-e23d9750="" class="d-table-td w-3 text-right"><span data-v-e23d9750="">-</span></div>
                                                </div>
                                            <?php endif; ?>
                                        </div>
                                        <div data-v-e23d9750="" class="d-table-footer">
                                            <div data-v-e23d9750="" class="d-table-controls"></div>
                                            <div data-v-e23d9750="" class="d-table-summary">
                                                <div data-v-e23d9750="" class="d-table-summary-item">
                                                    <div data-v-e23d9750="" class="tu d-table-label"><?php echo e(__('Sub Total')); ?>:</div>
                                                    <div data-v-e23d9750="" class="d-table-value"><?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,$invoice->getSubTotal(),true)); ?></div>
                                                </div>
                                                <?php if($invoice->getTax()): ?>
                                                    <div data-v-e23d9750="" class="d-table-summary-item">
                                                        <div data-v-e23d9750="" class="tu d-table-label"><?php echo e($invoice->tax->name); ?> (<?php echo e($invoice->tax->rate); ?>%):</div>
                                                        <div data-v-e23d9750="" class="d-table-value"><?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,$invoice->getTax(),true)); ?></div>
                                                    </div>
                                                <?php endif; ?>
                                                <div data-v-e23d9750="" class="d-table-summary-item">
                                                    <div data-v-e23d9750="" class="fwb f-b tu d-table-label"><?php echo e(__('Total')); ?>:</div>
                                                    <div data-v-e23d9750="" class="fwb f-b d-table-value"><?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,($invoice->getSubTotal()+$invoice->getTax()),true)); ?></div>
                                                </div>
                                                <div data-v-e23d9750="" class="d-table-summary-item">
                                                    <div data-v-e23d9750="" class="tu d-table-label"><?php echo e(__('Due Amount')); ?>:</div>
                                                    <div data-v-e23d9750="" class="d-table-value"><?php echo e(\App\Models\Utility::projectCurrencyFormat($invoice->project_id,$invoice->getDue(),true)); ?></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div data-v-e23d9750="" class="break-50"></div>
                                <div data-v-e23d9750="" class="row">
                                    <div data-v-e23d9750="" class="col-66"></div>
                                    <div data-v-e23d9750="" class="col-33"></div>
                                </div>
                                <div>
                                    <b><?php echo e($footer['invoice_footer_title']); ?></b>
                                    <p><?php echo e($footer['invoice_footer_note']); ?></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php if(!isset($preview)): ?>
    <?php echo $__env->make('invoices.script', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>;
<?php endif; ?>
</body>
</html>
<?php /**PATH D:\Main Projects\TaskMagix\in\app\resources\views/invoices/templates/template5.blade.php ENDPATH**/ ?>