<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ToDoComponent extends Model{
    protected $table = 'todocomponents';

    /**
     * Set the autotimestamps to false
     * 
     * @var bool $timestamps
     */
    public $timestamps = false;

    /**
     * The fillable fields.
     * 
     * @var  array $fillable
     */
    protected $fillable = [
        'title', 'description', 'priority', 'image_url',
    ];

    public static function boot(){

        /* call parent boot method */
        parent::boot();

    }
}
