@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">@if(isset($blog)) Edit Blog @else Add Blog @endif</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('save_blog') }}" enctype="multipart/form-data" id="blogForm">
                        @csrf
                        @if(isset($blog))
                        <input type="hidden" name="id" value="{{ $blog->id }}">
                        @endif
                        <div class="row mb-3">
                            <label for="name" class="col-md-4 col-form-label text-md-end">Title</label>

                            <div class="col-md-6">
                                <input id="title" type="text" class="form-control @error('title') is-invalid @enderror" name="title" value="@if(isset($blog)){{ $blog->title }}@endif" required autocomplete="name" autofocus>

                                @error('title')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="name" class="col-md-4 col-form-label text-md-end">Start Date</label>

                            <div class="col-md-6">
                                <input id="start_date" type="text" class="form-control @error('start_date') is-invalid @enderror date" name="start_date" value="@if(isset($blog)){{ $blog->start_date }}@endif" required autocomplete="start_date" autofocus>

                                @error('start_date')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="email" class="col-md-4 col-form-label text-md-end">End Date</label>

                            <div class="col-md-6">
                                <input id="end_date" type="text" class="form-control @error('end_date') is-invalid @enderror date" name="end_date" value="@if(isset($blog)){{ $blog->end_date }}@endif" required autocomplete="end_date">

                                @error('end_date')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                        </div>
                
                        <div class="row mb-3">
                            <label for="formFile" class="col-md-4 col-form-label text-md-end">Image</label>
                            <div class="col-md-6">
                                @if(isset($blog))
                                <input type="hidden" name="image" value="{{ $blog->image }}">
                                @endif

                                <input class="form-control @error('dob') is-invalid @enderror" type="file" id="formFile" @if(!isset($blog)) required @endif name="image">
                                @error('dob')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                                @if(isset($blog))
                                <img src="{{ asset('storage/blog-images/'.$blog->image) }}" alt="" style="height: 200px; width:200px;">
                                @endif
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="formFile" class="col-md-4 col-form-label text-md-end">Description</label>
                            <div class="col-md-6">
                                <textarea name="description" id="description" class="form-control @error('description') is-invalid @enderror" required>@if(isset($blog)){{ $blog->description }}@endif</textarea>

                                @error('description')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror

                            </div>
                        </div>
                        
                        <div class="row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                   Save
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('#blogForm').validate();
    })
    $( function() {
        $( ".date" ).datepicker();
    } );
</script>
@endsection