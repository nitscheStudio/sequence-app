<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\LogoutController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UploadController;
use App\Http\Controllers\SampleController;
use App\Http\Controllers\DownloadController;
use App\Http\Controllers\GenreController;
use App\Http\Controllers\LikeController;
use App\Http\Controllers\InstrumentController;
use App\Http\Controllers\TagController;
use App\Http\Controllers\SearchController;

// Public routes (not protected)
// Route::post('/register', RegisterController::class);
Route::post('/login', LoginController::class);
Route::get('/samples', [SampleController::class, 'listSamples']);
Route::get('/sample/{id}', [SampleController::class, 'getSampleById']);
// Route::get('search', [SearchController::class, 'checkFilterableAttributes']);
// Protected Routes

// Route::middleware(['auth:sanctum'])->group(function() {
    //User-related routes

Route::post('/search', [SearchController::class, 'fetchAllFromIndex']);


Route::post('/logout', LogoutController::class);

Route::get('/user/{userId?}/liked-samples/',  [UserController::class, 'showLikedSamples']);
Route::get('/user/{userId}/uploaded-samples', [UserController::class, 'showUploadedSamples']);

Route::get('/user/{username}',[UserController::class, 'getByUsername']);
Route::post('/user/edit/profilePicture', [UserController::class, 'updateProfilePicture']);
Route::patch('/user/edit/togglePrivateProfile', [UserController::class, 'togglePrivateProfile']);
Route::post('/user/edit/updateBio', [UserController::class, 'updateBio']);

// Sample-related routes
Route::post('/uploadSample', UploadController::class);
Route::get('/sample/download/{id}', DownloadController::class)->middleware('web');
Route::patch('/sample/edit/{id}', [SampleController::class, 'editSample']);
Route::delete('/sample/delete/{sampleId}', [SampleController::class, 'deleteSample']);
Route::get('/genres', GenreController::class);
Route::get('/instruments', InstrumentController::class);
route::get('/samples/tags', [TagController::class, 'getAllTags']);

// Like-related routes
Route::post('/sample/{id}/like', [LikeController::class, 'toggleLikeSample']);
// });

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});






