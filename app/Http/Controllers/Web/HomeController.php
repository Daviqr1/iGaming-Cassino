<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\BetCategory;
use App\Models\BetEvent;
use App\Models\BetSection;
use App\Models\Category;
use App\Models\Game;
use App\Models\GameExclusive;
use App\Models\GamesKscinus;
use Carbon\Carbon;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $gamesPopulars      = Game::orderBy('views', 'desc')->whereActive(1)->limit(6)->get();
        $games              = Game::limit(24)->whereActive(1)->get();
        $gamesExclusives    = GameExclusive::whereActive(1)
                            ->orderBy('views', 'desc')
                            ->get();
		$gamesPragmatic    = GamesKscinus::whereStatus(1)
                            ->orderBy('views', 'desc')
                            ->get();

        $events = BetEvent::where('bet_category_id', 1)
            ->whereDate('event_day', '>=', Carbon::today())
            ->orderBy('event_day', 'desc')
            ->orderByRaw('CASE
                WHEN DATE(event_day) = ? THEN 0
                ELSE 1
                END', [Carbon::today()->toDateString()])
            ->take(8)
            ->get();

        return view('web.home.index', [
            'gamesPopulars' => $gamesPopulars,
            'games' => $games,
            'gamesExclusives' => $gamesExclusives,
			'gamesPragmatic' => $gamesPragmatic,
            'events' => $events
        ]);
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     */
    public function banned()
    {
        return view('web.banned.index');
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     */
    public function howWorks()
    {
        return view('web.home.how-works');
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     */
    public function aboutUs()
    {
        return view('web.home.about-us');
    }

    /**
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     */
    public function suporte()
    {
        return view('web.home.suporte');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

    }

    /**
     * Display the specified resource.
     */
    public function showGameByCategory(string $slug)
    {
        $category = Category::where('slug', $slug)->first();
        if(!empty($category)) {
            $games = Game::where('category_id', $category->id)->whereActive(1)->paginate();

            return view('web.categories.index', compact(['games', 'category']));
        }

        return back();
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
