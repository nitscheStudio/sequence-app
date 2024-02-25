<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;


use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function getByUsername($username) {
        $user = User::where('username', $username)->first();

        if(!$user) {
            return response()->json(['message' => 'User not fournd'], 404);
        }

        return response()->json($user);
        
    }

    public function showLikedSamples(Request $request, $userId = null)
    {   
       // If user id is provided we can show the liked samples based on whether the users profile is public or private
       // else we show the current user his own liked samples
       
        if ($userId) {
            $user = User::findOrFail($userId);
        } else {
            $user = $request->user();
        }
        // Check if the profile is private and the requesting user is not the same
        if ($user->is_private && $request->user()->id !== $user->id) {
            return response()->json(['message' => 'This user’s liked samples are not available.'], 403);
        }

        // Retrieve the liked samples
        $likedSamples = $user->likedSamples()
                ->with('tags')
                ->withCount('likes')
                ->orderBy('created_at', 'desc')
                ->paginate(10);
                
        $likedSamples->getCollection()->transform(function ($sample) {
            $sample->isLikedByCurrentUser = $sample->isLikedByCurrentUser();
            return $sample;
        });               
    
        return response()->json([
            'total' => $likedSamples->total(), // Total number of samples
            'pages' => $likedSamples->lastPage(), // Total number of pages
            'samples' => $likedSamples->items() // The samples for the current page
        ]);
    }

    public function showUploadedSamples(Request $request, $userId = null)
    {
        if ($userId) {
            $user = User::findOrFail($userId);
        } else {
            $user = $request->user();
        }

        if ($user->is_private && $request->user()->id !== $user->id) {
            return response()->json(['message' => 'This user’s uploaded samples are not available.'], 403);
        }
        
        // dd($user);
        $uploadedSamples = $user->samples()
                ->with('tags')
                ->withCount('likes')
                ->orderBy('created_at', 'desc')
                ->paginate(10);

                $uploadedSamples->getCollection()->transform(function ($sample) {
                    $sample->isLikedByCurrentUser = $sample->isLikedByCurrentUser();
                    return $sample;
            
        });
    
        return response()->json([
            'total' => $uploadedSamples->total(), // Total number of samples
            'pages' => $uploadedSamples->lastPage(), // Total number of pages
            'samples' => $uploadedSamples->items() // The samples for the current page
        ]);
    }

    public function togglePrivateProfile(Request $request)
    {
        $user = $request->user();
    
        if ($user->is_private) {
            $user->is_private = false;
            $message = 'Your profile is now public.';
        } else {
            $user->is_private = true;
            $message = 'Your profile is now private.';
        }
    
        $user->save();
    
        return response()->json(['message' => $message]);
    }
    
    public function updateProfilePicture(Request $request)
    {  
        Log::info($request->all());
        $rules = [
            'profile_picture' => [
                'required',
                'image',
                'mimes:jpg,jpeg,png, webp',
                'max:4096' // 4MB Max
            ],
        ];
        

        $validation = Validator::make($request->all(), $rules);
        $user = $request->user(); 
        Log::info($user);

        
        if($validation->fails()) {
            return response()->json(['errors' => $validation->errors()], 400);
        }
        
        
        
        if ($request->hasFile('profile_picture')) {
            $file = $request->file('profile_picture');
            $fileName = Str::uuid() . '.' . $file->extension(); // Use the $file object for getting the extension
    
            try {
                // Delete old file if exists
                if ($user->profile_picture_path && Storage::disk('public')->exists($user->profile_picture_path)) {
                    Storage::disk('public')->delete($user->profile_picture_path);
                }
    
                // Store the file in the 'public/profile_pictures' directory under the new filename
                $path = $file->storeAs('profile_pictures', $fileName, 'public');
    
                // Update the user's profile with the new file path
                $user->profile_picture_path = $path;
                $user->save();
    
                return response()->json(['message' => 'Profile picture successfully updated.', 'path' => $path]);
            } catch (\Exception $e) {
                Log::error('Failed to update profile picture for user: ' . $user->id, ['error' => $e->getMessage()]);
                return response()->json(['message' => 'An error occurred while uploading the profile picture.'], 500);
            }
        }
    }

    public function updateBio(Request $request)
    {
        $validatedData = $request->validate([
            'bio' => 'required|string|max:250'
        ]);

        $user =  $request->user();

        $user->bio = $validatedData['bio'];
        $user->save();

        return response()->json(['message' => 'You successfully updated your bio'], 200);

    }

    public function getUserDetails(Request $request)
    {
        $user = $request->user();

        $samplesCount = $user->samples()->count();
    
        // Return the user data along with the new fields
        return response()->json([
            'id' => $user->id,
            'username' => $user->username,
            'email' => $user->email, // Assuming you want to include the email
            'is_private' => $user->is_private,
            'profile_picture_path' => $user->profile_picture_path,
            'samplesCount' => $samplesCount,
    
            // Add any other fields as needed
        ]);
    }

    public function deleteUser(Request $request)
    {
        $user = $request->user();
        try {
            //Explicitly delete Samples
            $user->samples->each(function($sample) {
                $sample->delete(); 
            });
            // Delete the user
            $result = $user->delete();
    
            // Check if the deletion was successful
            if ($result) {
                return response()->json(['message' => 'User deleted successfully.'], 200);
            } else {
                return response()->json(['message' => 'Failed to delete the user.'], 500);
            }
        } catch (\Exception $e) {
            // Return an error response in case of exception
            return response()->json(['message' => 'An error occurred while deleting the user.', 'error' => $e->getMessage()], 500);
        }

    }

    public function getLikedSamples(Request $request) {
        if (Auth::check()) {
            $userId = Auth::id();
            $user = User::find($userId);
    
            // Fetch IDs of samples liked by the current user
            $likedSampleIds = $user->likedSamples()->pluck('samples.id');
            return response()->json($likedSampleIds);
        }
    
        // Handle the case where the user is not authenticated
        return response()->json(['error' => 'User not authenticated'], 401);
    }

}
