<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class BetEvent extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'bet_events';
    protected $appends = ['dateHumanReadable', 'createdAt', 'betsCount', 'betsAmounts', 'betsAmountsWithPercent'];


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'bet_category_id',
        'cover',
        'name',
        'description',
        'event_a',
        'event_a_logo',
        'event_b',
        'event_b_logo',
        'event_day',
        'event_result_a',
        'event_result_b',
        'finished'
    ];

    /**
     * @return mixed
     */
    public function getBetsCountAttribute()
    {
        return $this->bets()->count();
    }

    /**
     * @return mixed
     */
    public function getBetsAmountsAttribute()
    {
        return $this->bets()->sum('amount');
    }

    /**
     * @return mixed
     */
    public function getBetsAmountsWithPercentAttribute()
    {
        $totalPremio = $this->bets()->sum('amount');
        $setting = \Helper::getSetting();
        $lucroCasa = \Helper::porcentagem_xn($setting->soccer_percentage, $totalPremio);
        return ($totalPremio - $lucroCasa);
    }

    /**
     * Photos
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function bets()
    {
        return $this->hasMany(BetUser::class, 'bet_event_id', 'id');
    }

    /**
     * @return BelongsTo
     */
    public function betCategory(): BelongsTo
    {
        return $this->belongsTo(BetCategory::class);
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
