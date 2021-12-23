<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminController extends Controller
{
    public function index(Request $request)
    {
        $blogs = Blog::with('users')->where('is_active','1')->whereDate('end_date','>',Carbon::now()->format('Y-m-d'))->get(); 
        // dd($blogs);  
        if(Auth::user()->role == 'admin') {
            return view('admin.index',compact('blogs'));
        } else {
            return redirect()->route('home');
        }
        
    }
}
