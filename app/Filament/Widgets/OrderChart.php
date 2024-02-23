<?php

namespace App\Filament\Widgets;

use App\Models\Order;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;

class OrderChart extends ChartWidget
{
    protected static ?string $heading = 'Apostas';

    protected static ?int $sort = 3;

    protected int | string | array $columnSpan = 'full';

    protected function getData(): array
    {
        $data = $this->getBetOrder();

        return [
            'datasets' => [
                [
                    'label' => 'Apostas na plataforma',
                    'data' => $data['orderPerMonth'],
                ],
            ],
            'labels' => $data['months'],
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }

    /**
     * @return array
     */
    private function getBetOrder(): array
    {
        $now = Carbon::now();
        $orderPerMonth = [];
        $months = [];

        collect(range(1, 12))->each(function($month) use ($now, &$orderPerMonth, &$months) {
            $monthDate = Carbon::parse($now)->month($month);
            $sum = Order::where('type', 'bet')->whereMonth('created_at', $monthDate)->sum('amount');

            $orderPerMonth[] = $sum;
            $months[] = $monthDate->format('M');
        });

        return [
            'orderPerMonth' => $orderPerMonth,
            'months' => $months
        ];
    }
}
