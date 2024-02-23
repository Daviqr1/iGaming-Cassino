<?php

namespace App\Console;

use App\Models\BetEvent;
use Carbon\Carbon;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule): void
    {
        // $schedule->command('inspire')->hourly();

        /// verificar as partidas a cada dois dias
        $schedule->command('sport:all-matches')
            ->weekly()->days([1,4])->at('6:00')
            ->at('03:00');

        $schedule->command('sport:check-matches')
            ->everyFiveMinutes();
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
