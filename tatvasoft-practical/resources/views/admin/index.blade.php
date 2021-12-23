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
    <table class="table table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">User Name</th>
                <th scope="col">Title</th>
                <th scope="col">Start Date</th>
                <th scope="col">End Date</th>
                <th scope="col">Actions</th>

            </tr>
        </thead>
        <tbody>
            @foreach($blogs as $key => $blog)
            <tr>
                <th scope="row">{{ $key + 1 }}</th>
                <td>{{ $blog->users->first_name }} {{ $blog->users->last_name }}</td>
                <td>{{ $blog->title }}</td>
                <td>{{ date('d M Y', strtotime($blog->start_date)) }}</td>
                <td>{{ date('d M Y', strtotime($blog->end_date)) }}</td> 
                <td><a href="{{ route('edit_blog',['id' => $blog->id]) }}">Edit</a>&nbsp;&nbsp;<a href="{{ route('delete_blog', ['id' => $blog->id]) }}">Delete</a></td>               
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
@endsection