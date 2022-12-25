<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{
    use HasFactory;
    protected $fillable = [
        'firstName',
        'lastName',
        'email',
        'password',
        'functional_level',
        'user_id',
    ];
}
