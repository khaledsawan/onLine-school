<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    use HasFactory;

    protected $fillable = [
        'teacher_id',
        'img',
        'name',
        'expected_time_to_finsh',
        'viewer_quntity',
        'category',
        'number_of_videos',
    ];

    public function users()
    {
    	return $this->belongsTo('App\Models\User');
    }
    public function videos()
    {
    	return $this->hasMany('App\Models\Video');
    }
    public function category()
    {
    	return $this->hasMany('App\Models\Category');
    }
}
