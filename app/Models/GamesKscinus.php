<?php

namespace App\Models {

	use Illuminate\Database\Eloquent\Factories\HasFactory;
	use Illuminate\Database\Eloquent\Model;
	use Illuminate\Database\Eloquent\Relations\BelongsTo;

	class GamesKscinus extends Model
	{
		use HasFactory;

		/**
		 * The database table used by the model.
		 *
		 * @var string
		 */
		protected $table = 'games_kscinus';

		/**
		 * The attributes that are mass assignable.
		 *
		 * @var array
		 */
		protected $fillable = [
			'title',
			'category_id',
			'type',
			'key',
			'money_ratio',
			'device',
			'views',
			'cover',
			'description',
			'status'
		];

		/**
		 * @return BelongsTo
		 */
		public function category(): BelongsTo
		{
			return $this->belongsTo(Category::class);
		}
	}
}
