<?php

namespace App\Models\Sample;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use Laravel\Scout\Searchable;

class Sample extends Model
{
    use HasFactory;
    use Searchable;

    protected $fillable = ['title', 'bpm', 'key', 'scale', 'type', 'genre_id', 'instrument_id', 'file_path', 'user_id'];

    //convert bpm to integer
    protected $casts = [
        'bpm' => 'integer',
    ];

    public function isLikedByCurrentUser()
    {
        return $this->likes()->where('user_id', auth()->id())->exists();
    }
    

    public function genre()
    {
        return $this->belongsTo(Genre::class);
    }

    public function instrument()
    {
        return $this->belongsTo(Instrument::class);
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function likes()
    {
        return $this->belongsToMany(User::class, 'likes')->withTimestamps();
    }

    public function searchableAs(): string
    {
        return 'samples_index';
    }

    public function toSearchableArray()
    {
        // Load the genre, instrument, and tags relationships
        $this->load('genre', 'instrument', 'tags');
        $this->loadCount('likes');
    
        // Customize the data to be indexed
        $array = $this->toArray();

        $userId = auth()->id(); // Get the current authenticated user's ID
        $array['isLikedByCurrentUser'] = $this->likes()->where('user_id', $userId)->exists();
    
        // Remove unnecessary fields
        unset($array['updated_at'], $array['genre_id'], $array['instrument_id']);
    
        // Include related model information in the index
        $array['genre'] = $this->genre?->name; 
        $array['instrument'] = $this->instrument?->name;
        $array['likes_count'] = $this->likes_count;
        $array['user_id'] = $this->user->id;
   
    
        // Transform tags into an array of objects with name and id
        $array['tags'] = $this->tags->map(function ($tag) {
            return [
                'id' => $tag->id, // Include tag id
                'name' => $tag->name // Include tag name
            ];
        })->toArray();

        $array['file_path'] = $this->file_path;

    
        return $array;

        // If the index is not updating use these commands: 
        //sail artisan scout:import "App\Models\Sample\Sample" | sail artisan queue:work
    }
} 

