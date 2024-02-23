<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\BetCategory;
use App\Models\BetEvent;
use App\Models\BetUser;
use App\Models\Category;
use Carbon\Carbon;
use Illuminate\Http\Request;

class BetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
//        $query_bets = BetEvent::query();
//
//        if(isset($request->searchTerm) && !empty($request->searchTerm) && strlen($request->searchTerm) > 3) {
//            $query_bets->whereLike(['name', 'description', 'event_a', 'event_a'], $request->searchTerm);
//        }
//
//        $categorias = BetCategory::whereNull('bet_category_id')->has('betEvents')->get();
//
//        $events = $query_bets
//            ->orderByRaw('CASE
//                WHEN DATE(event_day) = ? THEN 0
//                ELSE 1
//                END', [Carbon::today()->toDateString()])
//            ->orderBy('event_day', 'desc')
//            ->paginate();
//        $search = $request->searchTerm ?? '';


        $categoryFilter = $request->categoryFilter ?? 'brasileirao-serie-a';
        $query_bets = BetEvent::query();

        if($categoryFilter != 'all') {
            $categorySelected = BetCategory::where('slug', $categoryFilter)->first();
            if($categorySelected) {
                $query_bets->where('bet_category_id', $categorySelected->id);
            }
        }

        if(isset($request->searchTerm) && !empty($request->searchTerm) && strlen($request->searchTerm) > 3) {
            $query_bets->whereLike(['name', 'description', 'event_a', 'event_a', 'betCategory.name'], $request->searchTerm);
        }

        /// Fuebol
        $categoriesSoccer = BetCategory::where('bet_section_id', 1)->pluck('id'); // Pega todas categorias de futebol
        $soccerEvents = $query_bets->whereIn('bet_category_id', $categoriesSoccer)
            ->whereDate('event_day', '>=', Carbon::today())
            ->orderBy('event_day', 'desc')
            ->orderByRaw('CASE
                WHEN DATE(event_day) = ? THEN 0
                ELSE 1
                END', [Carbon::today()->toDateString()])
            ->paginate();
        $soccerEvents->setPageName('affiliate_history');
        $search = $request->searchTerm ?? '';


        return view('web.bets.index', [
            'categories' => BetCategory::orderBy('id', 'asc')->get(),
            'soccerEvents' => $soccerEvents,
            'search' => $search,
            'categoryFilter' => $categoryFilter
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if(auth()->check()) {
            $rules = [
                'bet_event_id' => 'required',
                'amount' => 'required|numeric|min:10',
                'event_result_a' => 'required|numeric',
                'event_result_b' => 'required|numeric',
            ];

            $messages = [
                'amount.min' => 'O valor minimo de aposta é de R$ 10,00.',
            ];

            $validator = \Validator::make($request->all(), $rules, $messages);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }

            $matche = BetEvent::find($request->bet_event_id);
            if(strtotime($matche->event_day) < strtotime(now())) {
                return redirect()->back();
            }

            if(auth()->user()->wallet->balance < $request->amount) {
                return redirect()->back()->with(['error' => 'Você não tem saldo suficiente'])->withInput();
            }

            if(auth()->user()->wallet->decrement('balance', $request->amount)) {
                $data = $request->only(['bet_event_id', 'event_result_a', 'amount', 'event_result_b']);

                $data['user_id'] = auth()->user()->id;

                if(BetUser::create($data)) {
                    return redirect()->back()->with(['success' => 'Aposta criada com sucesso!']);
                }

                return redirect()->back()->with(['error' => 'Erro ao criar aposta'])->withInput();
            }
        }else{
            return redirect()->back()->with(['error' => 'Você precisa logar para apostar'])->withInput();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $event = BetEvent::find(base64_decode($id));
        $bets  = BetUser::where('bet_event_id', base64_decode($id))->latest()->paginate(4);
        return view('web.bets.show', ['event' => $event, 'bets' => $bets]);
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
