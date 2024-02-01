<?php

namespace App\Http\Controllers;
use App\Models\Sample\Instrument;

use Illuminate\Http\Request;

class InstrumentController extends Controller
{
    public function __invoke() 
    {
    
        $instruments = Instrument::select('id', 'name')->get();
        return response()->json($instruments);


    }
}
