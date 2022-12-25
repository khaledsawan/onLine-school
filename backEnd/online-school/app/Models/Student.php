<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;

    protected $fillable = [
        'package',
        'dio',
        'telegram',
        'phone',
        'user_id',
    ];
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }
    public function playlists()
    {
    	return $this->hasMany('App\Models\PlayList');
    }

}
