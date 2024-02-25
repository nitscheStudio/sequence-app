<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sample\Sample;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Storage;
use App\Models\sample\Tag;
use Illuminate\Support\Facades\Log;



class SampleController extends Controller
{
    public function listSamples()
    {
        //retrieve all samples with all external data (tags, likes)
        $samples = Sample::with('tags')
                        ->withCount('likes')
                        ->orderBy('created_at', 'desc')
                        ->paginate(10);
               
        $samples->getCollection()->transform(function ($sample) {
            $sample->isLikedByCurrentUser = $sample->isLikedByCurrentUser();


            return $sample;
        });  
                
        return response()->json([
            'total' => $samples->total(), // Total number of samples
            'pages' => $samples->lastPage(), // Total number of pages
            'samples' => $samples->items() // The samples for the current page
        ]);
    
    }

    public function getSampleById($sampleId)
    {   
        //Get the sample including the tags associated with that sample
        $sample = Sample::with('tags')
                        ->find($sampleId);      

        if (!$sample) {
            return response()->json(['message' => 'Sample not found'], 404);
        }

        return response()->json($sample);
    }


    
    public function editSample(Request $request, $sampleId)
{
    $sample = Sample::with('tags')->findOrFail($sampleId);

    if ($request->user()->id !== $sample->user_id) {
        return response()->json(['message' => 'Unauthorized. You can only edit your own samples.'], 403);
    }
    Log::info('Edit sample request data: ', $request->all());



    $validatedData = $request->validate([
        'title' => ['sometimes', 'string', 'max:120'],
        'bpm' => ['sometimes', 'integer', 'between:40,240'],
        'key' => ['sometimes', Rule::in(config('sampleSelections.key'))],
        'scale' => ['sometimes', Rule::in(config('sampleSelections.scale'))],
        'type' => ['sometimes', Rule::in(config('sampleSelections.type'))],
        'tags' => ['sometimes', 'array'],
        'tags.*' => ['integer', 'exists:tags,id'],   
        'genre_id' => ['sometimes', 'exists:genres,id'],
        'instrument_id' => ['sometimes', 'exists:instruments,id'],
    ]);

    // If tags are provided, sync them
    if ($request->has('tags')) {
        $sample->tags()->sync($validatedData['tags']);
    }

    unset($validatedData['tags']); // Remove the tags key, tags have been handled separately
    $sample->update($validatedData);

    //Refresh tags before responding
    $sample->load('tags');

    return response()->json(['message' => 'Sample updated successfully', 'sample' => $sample], 200);
}


    public function deleteSample(Request $request, $sampleId)
    {
        $sample = Sample::findOrFail($sampleId);

        // if (!$sample) {
        //     return response()->json(['message' => 'Sample not found'], 404);
        // }
          // Check if the authenticated user is the one who uploaded the sample
        if ($request->user()->id !== $sample->user_id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

         // Delete the associated file from storage
        if (Storage::disk('public')->exists($sample->file_path)) {
            Storage::disk('public')->delete($sample->file_path);
        }

        $sample->delete();
     

        return response()->json(['message' => 'Sample successfuly deleted'], 200);
    }

}
