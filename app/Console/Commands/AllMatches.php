<?php

namespace App\Console\Commands;

use App\Traits\Sport\SportTrait;
use Illuminate\Console\Command;

class AllMatches extends Command
{
    use SportTrait;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sport:all-matches';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        return $this->prepararPartidas();
    }
}
