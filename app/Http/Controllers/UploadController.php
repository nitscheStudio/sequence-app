<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Str;
use App\Models\Sample\Sample;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\File;
use App\Models\sample\Tag;




class UploadController extends Controller
{
    public function __invoke(Request $request)

    {   
        Log::info('Upload request:', $request->all());

        
        $rules = ([
            'title' => ['required', 'string', 'max:120', 'min:8'],
            'bpm' => ['required', 'integer', 'between:40,240'],
            'key' => ['required', Rule::in(config('sampleSelections.key'))],
            'scale' => ['required', Rule::in(config('sampleSelections.scale'))],
            'type' => ['nullable', Rule::in(config('sampleSelections.type'))],

            'tags' => ['sometimes','array'],
            'tags.*' => ['string', 'max:25'],

            'genre_id' => ['required', 'exists:genres,id'],
            'instrument_id' => ['required', 'exists:instruments,id'],
            'sample_file' => [
                'required',
                'file',
                File::types(['mp3', 'wav'])
                    ->min(60) 
                    ->max(20480) 
            ],
        ]);

        $validation = Validator::make($request->all(), $rules);

 

        if ($validation->fails()) {
            return response()->json(['errors' => $validation->errors()], 400);
            Log::error('Upload validation failed:', $validation->errors()->all());

        }

        // Try to upload the sample
        try {
            if ($request->hasFile('sample_file')) {
                //renaming file
                $fileName = Str::uuid() . '_' . $request->file('sample_file')->getClientOriginalExtension();
        
                $path = $request->file('sample_file')->storeAs('samples', $fileName, 'public');

               
                
                //Create new instance of Sample model
                $sample = new Sample;
        
                // Fill instance with user input data
                $sample->user_id = auth()->id();
                $sample->file_path = $path;
                $sample->title = $request->title;
                $sample->bpm = $request->bpm;
                $sample->key = $request->key;
                $sample->scale = $request->scale;
                $sample->type = $request->type;
                $sample->genre_id = $request->genre_id;
                $sample->instrument_id = $request->instrument_id;
            
                // $sample->user_id = $request->user_id;
                $sample->save();
                

        
                $tagIds = [];  // To collect ids of tags
        
                foreach ($request->input('tags', []) as $tagName) {

                Log::info('Original tag name:', [$tagName]);

                    // Trim, convert to lowercase, and strip any tags
                    $sanitizedTagName = strip_tags(trim($tagName));
                    Log::info('Sanitized tag name:', [$sanitizedTagName]);

                    if(!empty($sanitizedTagName)) {
                        $tag = Tag::firstOrCreate(['name' => $sanitizedTagName]); 
                        $tagIds[] = $tag->id;
                    }
                }
        
                //attach tag to sample after sample has gotten an id
                $sample->tags()->sync($tagIds);
        
                return response()->json(['message' => 'Upload successful!'], 200);
            }
        } catch(\Exception $e) {
                Log::error($e);
                Log::error($e->getMessage());
                Log::error($e->getTraceAsString());

                

                // Return a generic error response
                return response()->json(['message' => 'An error occurred during the upload.'], 500);
        }
    }
    
}
