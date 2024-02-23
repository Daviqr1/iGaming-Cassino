<?php

namespace App\Console\Commands;

use App\Traits\Sport\SportTrait;
use Illuminate\Console\Command;

class CheckMatchesCommand extends Command
{
    use SportTrait;

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sport:check-matches';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Verificar as partidas em andamento';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->verificarPartidas();
    }
}
