<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\sample\Genre;

class GenresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     * Populate the db with data from the config file
     */
    public function run(): void
    {
        //Fetching data from config file
        $genres = config('sampleSelections.genres');
        //Check for each genre if a db entry exists. If not it creates it.
        foreach ($genres as $genre) {
            Genre::firstOrCreate(['name' => $genre]);
        }
    }
}
