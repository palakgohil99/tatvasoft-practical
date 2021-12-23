<?php

use App\Http\Controllers\AdminController;
use App\Http\Controllers\Auth\LoginController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\HomeController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('home')->middleware('auth_middleware');
Route::get('/blogs', [HomeController::class, 'index'])->name('home');
Route::get('register',[RegisterController::class, 'index'])->name('register');
Route::post('save-register',[RegisterController::class, 'save'])->name('save_register');

Route::get('login',[LoginController::class, 'index'])->name('login');
Route::post('save-login',[LoginController::class, 'save'])->name('save_login');
Route::get('logout',[LoginController::class, 'logout'])->name('logout');

//Route::get('blogs',[HomeController::class, 'index'])->name('blogs');
Route::get('add-blog',[HomeController::class, 'addBlog'])->name('add_blog');
Route::post('save-blog',[HomeController::class, 'save'])->name('save_blog');
Route::get('edit-blog/{id}',[HomeController::class, 'edit'])->name('edit_blog');
Route::get('delete-blog/{id}',[HomeController::class, 'delete'])->name('delete_blog');

Route::get('admin/blogs',[AdminController::class, 'index'])->name('admin_blogs');




