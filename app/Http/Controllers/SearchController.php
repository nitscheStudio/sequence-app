<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use MeiliSearch\Client;
use Illuminate\Support\Facades\Log;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        Log::info('Search request received', $request->all());
        try {
            $client = new Client('http://meilisearch:7700', 'masterKey');
            $index = $client->index('samples_index');
            $bpmRange = $request->input('bpmRange', []);
            $genre_id = $request->input('genre_id', null);
            $instrument_id = $request->input('instrument_id', null);
            $key = $request->input('key', '');
            $scale = $request->input('scale', '');
        
            $filters = [];
            Log::info('Search filters:', $filters);
        
            // Add genre_id filter if provided
            if (!is_null($genre_id)) {
                $filters[] = "genre_id = $genre_id";
            }
            
            // Add instrument_id filter if provided and not null
            if (!is_null($instrument_id)) {
                $filters[] = "instrument_id = $instrument_id";
            }
            
            // Add key filter if provided and not null
            if (!empty($key)) {
                $filters[] = "key = \"$key\"";
            }
            
            // Add scale filter if provided and not null
            if (!is_null($scale)) {
                $filters[] = "scale = \"$scale\"";
            }
        
            // Handle BPM range
            if (!empty($bpmRange) && count($bpmRange) == 2) {
                $minBpm = $bpmRange[0];
                $maxBpm = $bpmRange[1];
                $filters[] = "bpm >= $minBpm AND bpm <= $maxBpm";
            }
        
            $searchOptions = [];
            if (!empty($filters)) {
                $searchOptions['filter'] = implode(' AND ', $filters);
            }
            Log::info('Search Options;', $searchOptions);

            
            $results = $index->search('', $searchOptions);
            Log::info('MeiliSearch raw response:', ['response' => json_decode(json_encode($results), true)]);

        
            return response()->json($results);
        } catch (\Exception $e) {
            Log::error('Search error:', ['message' => $e->getMessage()]);
            return response()->json(['error' => 'An error occurred during the search.'], 500);
        }
    }

    public function fetchAllFromIndex(Request $request)
{
    Log::info('Fetch all request received');
    try {
        $client = new Client('host.docker.internal:7700/', 'masterKey');
        $index = $client->index('samples_index');   
        

        $searchOptions = [
            'limit' => 20 
        ];
        
        $results = $index->search('', $searchOptions);
        Log::info('MeiliSearch fetch all response:', ['response' => json_decode(json_encode($results), true)]);
        
        return response()->json($results);
    } catch (\Exception $e) {
        Log::error('Fetch all error:', ['message' => $e->getMessage()]);
        return response()->json(['error' => 'An error occurred during fetching all documents.'], 500);
    }
}


    // public function search(Request $request)
    // {
    //     $client = new Client('http://meilisearch:7700', 'masterKey');
 
    //     $results =  $client->index('samples_index')->search('Tin');

    //     return response()->json(($results));
    // }

    public function checkFilterableAttributes()
{
    try {
        $client = new Client('http://meilisearch:7700', 'masterKey');
        $index = $client->index('samples_index');

        // Fetch the settings of the index
        $settings = $index->getSettings();

        // Extract the filterable attributes
        $filterableAttributes = $settings['filterableAttributes'] ?? [];

        // Log the filterable attributes
        Log::info('Filterable attributes:', $filterableAttributes);

        return response()->json(['filterableAttributes' => $filterableAttributes]);
    } catch (\Exception $e) {
        Log::error('Fetching filterable attributes error:', ['message' => $e->getMessage()]);
        return response()->json(['error' => 'An error occurred while fetching filterable attributes.'],  500);
    }
}

}
