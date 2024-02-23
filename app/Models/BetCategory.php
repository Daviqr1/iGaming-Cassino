<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;

class BetCategory extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'bet_categories';
    protected $appends = ['dateHumanReadable', 'createdAt'];


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'bet_section_id',
        'name',
        'description',
        'image',
        'slug',
        'active'
    ];

    /**
     * @return BelongsTo
     */
    public function betSection(): BelongsTo
    {
        return $this->belongsTo(BetSection::class);
    }

    /**
     * @return HasManyThrough
     */
    public function betEvents(): HasManyThrough
    {
        return $this->hasMany(BetEvent::class);
    }

    /**
     * @return mixed
     */
    public function getCreatedAtAttribute()
    {
        return Carbon::parse($this->attributes['created_at']);
    }

    /**
     * @return mixed
     */
    public function getDateHumanReadableAttribute()
    {
        return Carbon::parse($this->created_at)->diffForHumans();
    }
}
