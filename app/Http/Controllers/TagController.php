<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sample\Tag;

class TagController extends Controller
{
    /**
     * Retrieve all tags.
     *
     * @return \Illuminate\Http\Response
     */
    public function getAllTags()
    {
        $tags = Tag::all();

        return response()->json($tags);
    }
}