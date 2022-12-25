<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    use HasFactory;
    protected $fillable = [
        'img',
        'telegram',
        'dio',
        'phone',
        'viewer_quntity',
        'user_id',
    ];
    public function courses()
    {
    	return $this->hasMany('App\Models\Course');
    }
    public function videos()
    {
    	return $this->hasMany('App\Models\Video');
    }
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }
}
