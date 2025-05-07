@component('mail::message')
<p>{{__('Hello, '. $invoice->name)}}</p>
<br>
<span>{{__('It remind to you, amount ')}} <b>{{$invoice->getDue}}</b> {{__('is pending for invoice ')}} <b>{{$invoice->invoice}}</b></span>
<br>

@component('mail::button', ['url' => route('get.invoice', ['id' => \Illuminate\Support\Facades\Crypt::encrypt($invoice->id)])])
    {{__('Click to Download Invoice')}}
@endcomponent

{{__('Thanks,')}}<br>
{{ config('app.name') }}
@endcomponent
