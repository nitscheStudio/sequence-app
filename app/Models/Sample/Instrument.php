<?php

namespace App\Models\sample;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Instrument extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    public function samples()
    {
        return $this->hasMany(Sample::class);
    }
}
