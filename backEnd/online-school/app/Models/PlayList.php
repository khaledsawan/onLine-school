<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PlayList extends Model
{
    use HasFactory;

    protected $fillable = [
        'student_id',
        'name',
    ];

    public function students()
    {
    	return $this->belongsTo('App\Models\User');
    }
    public function videos()
    {
        return $this->belongsToMany('App\Models\Video');
    }
}
