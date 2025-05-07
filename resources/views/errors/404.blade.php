<!DOCTYPE html>
<html lang="en">


<head>

    @php
    $logo = \App\Models\Utility::get_file('logo/');
    $meta_logo = \App\Models\Utility::get_file('uploads/logo/');
    $settings = \App\Models\Utility::settings();
@endphp

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>
        {{ \App\Models\Utility::getValByName('header_text') ? \App\Models\Utility::getValByName('header_text') : config('app.name') }}- 404 Not Found</title>

    <meta name="title" content="404 - Not Found">
    <meta name="description" content="The page you are looking for could not be found.">
    <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0">
    <meta http-equiv="Cache-Control" content="post-check=0, pre-check=0" />
    <meta http-equiv="Pragma" content="no-cache">

    <link rel="icon" href="https://www.taskmagix.com/in/app//storage/logo/favicon.png" type="image/png">

    {{-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"> --}}
   
    {{-- @if (Auth::user()->mode == 'light') --}}
        <link rel="stylesheet" href="{{ asset('assets/css/site-light.css') }}">
    {{-- @else
        <link rel="stylesheet" href="{{ asset('assets/css/site-dark.css') }}">
    @endif --}}

    <style>
        .btn-primary {
    background-color: #449fc6 !important;
    border-color: #449fc6 !important;
}
.btn svg:not(:last-child), .btn i:not(:last-child) {
    margin-right: 0px !important;
}
    </style>

</head>
    <body>
        <div class="container-fluid">
            <div class="main-content">
                <div class="page-content">
                    <div class="d-flex align-items-center justify-content-center vh-100">
                        <div class="text-center">
                            <h1 class="display-1 fw-bold">404</h1>
                            <p class="fs-3"> <span class="text-danger">Opps!</span> Page not found.</p>
                            <p class="lead">
                                The page you’re looking for doesn’t exist.
                            </p>
                            <a href="javascript:history.back()" class="btn btn-sm btn-primary rounded-pill m-3">
                                <svg fill="#ffffff" width="20px" height="20px" viewBox="-8.5 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg">
                                    <title>left</title>
                                    <path d="M7.094 15.938l7.688 7.688-3.719 3.563-11.063-11.063 11.313-11.344 3.531 3.5z"></path>
                                    </svg><span style="font-size: 16px;">Go Back</span></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</body>

</html>
