<?php

namespace App\Http\Controllers;

use App\Http\Requests\BlogRequest;
use App\Models\Blog;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index()
    {
        if(Auth::user()) {
            $blogs = Blog::where('user_id', Auth::user()->id)->where('is_active','1')->whereDate('end_date','>',Carbon::now()->format('Y-m-d'))->get();    
        } else {
            $blogs = Blog::where('is_active','1')->whereDate('end_date','>',Carbon::now()->format('Y-m-d'))->get();    
        }
        if(Auth()->user()) {
            if(Auth::user()->role == 'user') {
                return view('welcome',compact('blogs'));
            } else {
                return redirect()->route('admin_blogs');
            }
        } else {
            return view('welcome',compact('blogs'));
        }
        
        
    }

    public function addBlog(Request $request)
    {
        return view('blogs.add-edit');
    }

    public function save(BlogRequest $request)
    {
        //dd(storage_path('app/public/blog-images'));
        if(isset($request->id) && !empty($request->id)) {
            $blog = Blog::where('id', $request->id)->first();
        } else {
            $blog = new Blog();
        }        
        $blog->user_id = Auth::user()->id;
        $blog->title = $request->title;
        $blog->start_date = date('Y-m-d',strtotime($request->start_date));
        $blog->end_date =date('Y-m-d',strtotime($request->end_date));
        if($request->hasFile('image')) {
            $imageName = time().'.'.$request->image->extension();  
            $request->image->move(storage_path('app\public\blog-images'), $imageName);

            $blog->image = $imageName;

        }
        $blog->description = $request->description;
        $blog->save();

        if(Auth::user()->role == 'admin') {
            return redirect()->route('admin_blogs');
        } else {
            return redirect()->route('home');
        }        
    }

    public function edit(Request $request,$id)
    {
        $blog = Blog::where('id', $id)->first();
        return view('blogs.add-edit',compact('blog'));
    }
    
    public function delete(Request $request, $id)
    {
        $blog = Blog::where('id', $id)->first();
        $blog->is_active = '0';
        $blog->save();
        return redirect()->back();
    }
}
