<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JPG extends Model
{
    use HasFactory;

    /**
     * @var string
     */
    protected $table = 'jpg';

    /**
     * @var string
     */
    protected $primaryKey = 'id'; // Defina a chave primária se não for 'id'

    /**
     * @var bool
     */
    public $timestamps = false; // Defina como 'true' se você usar colunas 'created_at' e 'updated_at'

    /**
     * @var string[]
     */
    protected $fillable = [
        'date_time',
        'name',
        'balance',
        'start_balance',
        'pay_sum',
        'percent',
        'user_id',
    ];
}
