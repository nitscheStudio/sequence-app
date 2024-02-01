<?php

namespace App\Models\sample;

use App\Models\Sample\Sample;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Genre extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function samples()
    {
        return $this->hasMany(Sample::class);
    }
}
