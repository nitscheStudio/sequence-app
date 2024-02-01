<?php

namespace App\Http\Controllers;
use App\Models\Sample\Genre;

use Illuminate\Http\Request;

class GenreController extends Controller
{
    public function __invoke() 
    {
    
        $genre = Genre::select('id', 'name')->get();
        return response()->json($genre);


    }
}
