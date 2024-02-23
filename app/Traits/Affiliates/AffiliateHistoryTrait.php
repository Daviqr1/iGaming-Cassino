<?php

namespace App\Traits\Affiliates;

use App\Models\AffiliateHistory;
use App\Models\User;

trait AffiliateHistoryTrait
{

    /**
     * @param User $user
     * @param $commission
     * @return mixed
     */
    public static function saveAffiliateHistory($user)
    {
        $sponsor = User::find($user->inviter);

        if($sponsor->affiliate_revenue_share > 0) {
            AffiliateHistory::create([
                'user_id' => $user->id,
                'inviter' => $sponsor->id,
                'commission' => $sponsor->affiliate_revenue_share,
                'commission_type' => 'revshare',
                'deposited' => 0,
                'losses' => 0,
                'status' => 0
            ]);
        }

        if($sponsor->affiliate_cpa > 0) {
            AffiliateHistory::create([
                'user_id' => $user->id,
                'inviter' => $sponsor->id,
                'commission' => $sponsor->affiliate_cpa,
                'commission_type' => 'cpa',
                'deposited' => 0,
                'losses' => 0,
                'status' => 0
            ]);
        }

        return true;
    }
}
