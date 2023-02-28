<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();


// route guard example
Route::get('/routegate/admin', [App\Http\Controllers\AuthController::class, 'routegateadmin'])
->name('routegate.admin')
->middleware('can:isAdmin');

Route::get('/routegate/editor', [App\Http\Controllers\AuthController::class, 'routegateeditor'])
->name('routegate.editor')
->middleware('can:isEditor');

Route::get('/routegate/viewer', [App\Http\Controllers\AuthController::class, 'routegateviewer'])
->name('routegate.viewer')
->middleware('can:isViewer');


// contoller guard example
Route::get('/controllergate/admin', [App\Http\Controllers\AuthController::class, 'controllergateadmin'])->name('controllergate.admin');

Route::get('/controllergate/editor', [App\Http\Controllers\AuthController::class, 'controllergateeditor'])->name('controllergate.editor');

Route::get('/controllergate/viewer', [App\Http\Controllers\AuthController::class, 'controllergateviewer'])->name('controllergate.viewer');


// home redirect
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


// post redirect
Route::get('/posts', [App\Http\Controllers\PostController::class, 'index'])->name('post.index');

Route::get('/posts/{post}', [App\Http\Controllers\PostController::class, 'show'])->name('post.show');

Route::get('/posts/delete/{post}', [App\Http\Controllers\PostController::class, 'destroy'])->name('post.delete');
