<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    use HasFactory;
    protected $fillable = [
        'img',
        'course_id',
        'viewer_quntity',
        'isIntro',
        'url',
        'name',
        'descirption',
        'teacher_id',
    ];
    public function coursess()
    {
    	return $this->belongsTo('App\Models\Course');
    }
    public function playList()
    {
        return $this->belongsToMany('App\Models\PlayList');
    }
    public function comments()
    {
        return $this->morphMany(Comment::class, 'commentable')->whereNull('parent_id');
    }
}
