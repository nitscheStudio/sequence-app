<?php

namespace App\Http\Controllers;


use App\Models\Sample\Sample;

use Illuminate\Support\Facades\Storage;


class DownloadController extends Controller
{
    public function __invoke($sampleId)
    {   
        // Fetch the sample by its ID
        $sample = Sample::findOrFail($sampleId);

        //Fetch file path
        $filePath = $sample->file_path;
        // dd($filePath);

             // Check if the file exists in the local storage
             if (Storage::disk('public')->exists($filePath)) {
                // Return the file for download
                $extension = pathinfo($filePath, PATHINFO_EXTENSION);
                // dd('exist:', $extension);


                // Generate custom filename using the sample attributes
                $customFilename = sprintf(
                    '%s_%s_%s%s.%s', 
                    $sample->title,
                    $sample->bpm,
                    $sample->key,
                    $sample->scale,
                    
                    $extension
                );

                // dd($customFilename);
                // dd(Storage::disk('public')->exists($filePath));

                // return Storage::disk('public')->download($filePath, $customFilename);
                return response()->download(
                    storage_path("app/public/{$filePath}"), 
                    $customFilename
                );
                $file = storage_path("app/public/{$filePath}");
                // $headers = [
                //     'Content-Type' => 'application/octet-stream',
                //     'Content-Disposition' => 'attachment; filename="' . $customFilename . '"',
                // ];

                // return response()->file($file, $headers);

                
            }
    
            // If the file is not found, return a 404 error
            return response()->json(['message' => 'File not found!'], 404);
        }
}
