<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Sample\Sample;
use Illuminate\Support\Facades\Auth;

class LikeController extends Controller
{   
    public function toggleLikeSample(Request $request, $sampleId) {
       
        // $user = Auth::user();
        // dd($user);
       
        $user = $request->user();
        // dd($user);
        $sample = Sample::findOrFail($sampleId); // Ensure the sample exists

    
        if ($user->likedSamples()->where('sample_id', $sampleId)->exists()) {
            $user->likedSamples()->detach($sampleId);
            $sample->update();
            return response()->json(['status' => 'unliked']);
        } else {
            $user->likedSamples()->attach($sampleId);
            $sample->update();
            return response()->json(['status' => 'liked']);
        }

    }

}
