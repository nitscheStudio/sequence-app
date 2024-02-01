<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TagsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Clear the existing tags
        DB::table('tags')->delete();

        // Define the tags to be seeded
        $tags = [
            ['name' => 'Acoustic'],
            ['name' => 'Electronic'],
            ['name' => 'Distorted'],
            ['name' => 'Clean'],
            ['name' => 'Bright'],
            ['name' => 'Dark'],
            ['name' => 'Warm'],
            ['name' => 'Cold'],
            ['name' => 'Metallic'],
            ['name' => 'Wooden'],
            ['name' => 'Slow'],
            ['name' => 'Medium'],
            ['name' => 'Fast'],
            ['name' => 'Upbeat'],
            ['name' => 'Downbeat'],
            ['name' => 'Rhythmic'],
            ['name' => 'Syncopated'],
            ['name' => 'Steady'],
            ['name' => 'Variable'],
            ['name' => 'Loop'],
            ['name' => 'Energetic'],
            ['name' => 'Relaxed'],
            ['name' => 'Melancholic'],
            ['name' => 'Happy'],
            ['name' => 'Sad'],
            ['name' => 'Aggressive'],
            ['name' => 'Soothing'],
            ['name' => 'Mysterious'],
            ['name' => 'Romantic'],
            ['name' => 'Uplifting'],
            ['name' => 'Cinematic'],
            ['name' => 'Vintage'],
            ['name' => 'Modern'],
            ['name' => 'Futuristic'],
            ['name' => 'Ethnic'],
            ['name' => 'Experimental'],
            ['name' => 'Ambient'],
            ['name' => 'Textured'],
            ['name' => 'Spatial'],
            ['name' => 'Layered'],
        ];

        // Insert the tags into the database
        DB::table('tags')->insert($tags);
    }
}
