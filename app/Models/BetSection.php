<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BetSection extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'bet_sections';
    protected $appends = ['dateHumanReadable', 'createdAt'];


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'image',
        'active'
    ];


    /**
     * Photos
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function betCategories()
    {
        return $this->hasMany(BetCategory::class);
    }
}
