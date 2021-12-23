@extends('layouts.app')

@section('content')
<div class="relative flex items-top justify-center min-h-screen bg-gray-100 dark:bg-gray-900 sm:items-center py-4 sm:pt-0">
    <div class="hidden fixed top-0 right-0 px-6 py-4 sm:block">
        @if(empty(auth()->user()))
        <a href="{{ route('login') }}" class="text-sm text-gray-700 dark:text-gray-500 underline">Log in</a>
        <a href="{{ route('register') }}" class="ml-4 text-sm text-gray-700 dark:text-gray-500 underline">Register</a>
        @else
        <a href="{{ route('add_blog') }}" class="text-sm text-gray-700 dark:text-gray-500 underline">Add Blog</a>
        <a href="{{ route('logout') }}" class="ml-4 text-sm text-gray-700 dark:text-gray-500 underline">Logout</a>
        @endif
    </div>
    <div class="row">

        <div class="card-group">
            @foreach($blogs as $blog)
            <div class="card col-md-6">
                <img src="{{ asset('storage/blog-images/'.$blog->image) }}" class="card-img-top" alt="blog_image" style="height: 200px; width:200px;">
                <div class="card-body">
                    <h5 class="card-title">{{ $blog->title }}</h5>
                    <p class="card-text">{{ $blog->description }}</p>
                    <p class="card-text"><small class="text-muted">{{ date('d M',strtotime($blog->start_date)) }}</small></p>
                    @if(auth()->user())
                    <p class="card-text"><small class="text-muted"><a href="{{ route('edit_blog',['id' => $blog->id]) }}">Edit</a>&nbsp;&nbsp;<a href="{{ route('delete_blog', ['id' => $blog->id]) }}">Delete</a></small></p>
                    @endif
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
@endsection