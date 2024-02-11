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

     // Add the custom accessor to the appends array
     protected $appends = ['profile_picture_path'];


    public function isLikedByCurrentUser()
    {
        return $this->likes()->where('user_id', auth()->id())->exists();
    }

    public function getProfilePicturePathAttribute()
    {
        return $this->user->profile_picture_path;
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
    
        // Include genre_id and instrument_id directly
        $array['genre_id'] = $this->genre_id;
        $array['instrument_id'] = $this->instrument_id;
    
        // Include bpm
        $array['bpm'] = $this->bpm; // Assuming $this->bpm accesses the bpm attribute of the sample
    
        // Include likes count
        $array['likes_count'] = $this->likes_count;
    
        // Transform tags into an array of objects with name and id
        $array['tags'] = $this->tags->map(function ($tag) {
            return [
                'id' => $tag->id, // Include tag id
                'name' => $tag->name // Include tag name
            ];
        })->toArray();
    
        // Include file_path
        $array['file_path'] = $this->file_path;
    
        // Remove unnecessary fields to keep the index clean
        unset($array['updated_at'], $array['user_id'], $array['user'], $array['genre'], $array['instrument'], $array['tags_id']); // Assume 'tags_id' was a mistake since 'tags' is already included as an array
    
        return $array;
    }
    

    
    

       

    //     // If the index is not updating use these commands: 
    //     //sail artisan scout:import "App\Models\Sample\Sample" | sail artisan queue:work
    // 
} 

