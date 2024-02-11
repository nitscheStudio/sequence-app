<?php
namespace App\Console\Commands;

use App\Models\Sample\Sample;
use Illuminate\Console\Command;
use MeiliSearch\Client;

class UpdateMeilisearchFilters extends Command
{
    protected $signature = 'meilisearch:update-filters';
    protected $description = 'Update MeiliSearch filterable attributes';

    public function handle()
    {
        $client = new Client(config('scout.meilisearch.host'), config('scout.meilisearch.key'));
        Sample::makeAllSearchable(); 
        $client->index('samples_index')->updateFilterableAttributes(['genre_id', 'instrument_id', 'key', 'scale', 'bpm']);
    }
}