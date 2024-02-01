<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\sample\Instrument;

class InstrumentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $instruments = config('sampleSelections.instruments');

        foreach($instruments as $instrument) {
            Instrument::firstOrCreate(['name' => $instrument]);
        }
    }
}
