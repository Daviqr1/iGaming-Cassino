<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'settings';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'software_name',
        'software_description',
        'software_logo_white',
        'software_logo_black',
        'currency_code',
        'decimal_format',
        'currency_position',
        'prefix',
        'storage',
        'merchant_url',
        'merchant_id',
        'merchant_key',
        'min_deposit',
        'max_deposit',
        'min_withdrawal',
        'max_withdrawal',

        // Percent
        'ngr_percent',
        'revshare_percentage',
        'soccer_percentage',
        'initial_bonus',

        // Suitpay
        'suitpay_uri',
        'suitpay_cliente_id',
        'suitpay_cliente_secret',

        // smtp
        'software_smtp_type',
        'software_smtp_mail_host',
        'software_smtp_mail_port',
        'software_smtp_mail_username',
        'software_smtp_mail_password',
        'software_smtp_mail_encryption',
        'software_smtp_mail_from_address',
        'software_smtp_mail_from_name',

		// kscinus
		'kscinus_pvt_key',
		'kscinus_pub_key'
    ];

    protected $hidden = array('created_at', 'updated_at');
}
