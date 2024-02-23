@extends('layouts.web')

@section('title', 'Apostas em Jogos de Futebol | Cassino Online SPCASSINO')

@section('seo')
    <link rel="canonical" href="{{ url()->current() }}" />
    <meta name="description" content="Descubra o emocionante mundo das apostas em jogos de futebol na SPCASSINO, o melhor cassino online. Tenha acesso a uma ampla seleção de jogos de slot e desfrute de uma experiência de apostas única. Venha torcer pelo seu time e ganhar prêmios incríveis!">
    <meta name="keywords" content="Apostas em jogos de futebol, Cassino Online, Jogos de Slot, Apostas Esportivas, Apostas de Futebol, Cassino SPCASSINO">

    <meta property="og:locale" content="pt_BR" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="Apostas em Jogos de Futebol | Cassino Online SPCASSINO" />
    <meta property="og:description" content="Descubra o emocionante mundo das apostas em jogos de futebol na SPCASSINO, o melhor cassino online. Tenha acesso a uma ampla seleção de jogos de slot e desfrute de uma experiência de apostas única. Venha torcer pelo seu time e ganhar prêmios incríveis!" />
    <meta property="og:url" content="{{ url()->current() }}" />
    <meta property="og:site_name" content="Cassino Online SPCASSINO" />
    <meta property="og:image" content="{{ asset('/assets/images/banner-1.png') }}" />
    <meta property="og:image:secure_url" content="{{ asset('/assets/images/banner-1.png') }}" />
    <meta property="og:image:width" content="1024" />
    <meta property="og:image:height" content="571" />

    <meta name="twitter:title" content="Apostas em Jogos de Futebol | Cassino Online SPCASSINO">
    <meta name="twitter:description" content="Descubra o emocionante mundo das apostas em jogos de futebol na SPCASSINO, o melhor cassino online. Tenha acesso a uma ampla seleção de jogos de slot e desfrute de uma experiência de apostas única. Venha torcer pelo seu time e ganhar prêmios incríveis!">
    <meta name="twitter:image" content="{{ asset('/assets/images/banner-1.png') }}"> <!-- Substitua pelo link da imagem que deseja exibir -->
    <meta name="twitter:url" content="{{ url('/') }}"> <!-- Substitua pelo link da sua página -->
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/css/splide-core.min.css') }}">
@endpush

@section('content')
    <div class="container-fluid">
        @include('includes.navbar_left')

        <div class="page__content">
            @include('includes.navbar_top')

            <div class="row">
                <div class="col-lg-6">
                    <h2>Todas as <span class="text-primary">apostas</span></h2>
                </div>
                <div class="col-lg-6">
                    <form action="{{ route('web.bets.index') }}" class="w-full" method="GET">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </span>
                            <input type="text" name="searchTerm" class="form-control" placeholder="Digite o nome do jogo" value="{{ $search }}">

                            <span class="input-group-text" style="padding-right: 5px;">
                                <button type="submit" class="px-3">
                                    Buscar
                                </button>
                            </span>
                        </div>
                    </form>
                </div>
            </div>

            <section
                id="category-carousel"
                class="splide"
            >
                <div class="splide__track">
                    <ul class="splide__list bet-category-list">
                        <li class="splide__slide">
                            <a href="{{ url('/bets?categoryFilter=') }}" class="bet-category-item">
                                Todos
                            </a>
                        </li>
                        @foreach($categories as $category)
                            <li class="splide__slide @if($categoryFilter == $category->slug) bet-category-active @endif">
                                <a href="{{ url('/bets?categoryFilter='.$category->slug) }}" class="bet-category-item">
                                    @if($categoryFilter == $category->slug)
                                        <i class="fa-regular fa-futbol mr-2"></i>
                                    @endif

                                    {{ $category->name }}
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </section>

            <section class="row mb-3">
                <div class="col-lg-12">
                    <img src="{{ asset('assets/images/convide-amigo.jpg') }}" alt="" class="img-fluid" style="border-radius: 15px;">
                </div>
            </section>

            <div class="row">
                @foreach($soccerEvents as $matche)
                    @php
                        $createdAt = \Carbon\Carbon::parse($matche->event_day);
                        $dataFormatada = $createdAt->format('d/m');
                        $nomeDiaSemana = $createdAt->translatedFormat('l');
                        $horaFormatada = $createdAt->format('H:i');
                    @endphp

                    <div class="col-xl-3 col-lg-4 col-md-2 col-sm-1 mb-4">
                        @include('includes.futbol-card', [
                           'title' => $matche->name,
                           'reward' => $matche->betsAmounts > 0 ?  \Helper::amountFormatDecimal($matche->betsAmountsWithPercent) : 'Calculando...',
                           'cover' => $matche->cover,
                           'result_team_a' => $matche->event_result_a,
                           'logo_team_a' => asset('storage/'.$matche->event_a_logo),
                           'title_team_a' => $matche->event_a,
                           'result_team_b' => $matche->event_result_b,
                           'logo_team_b' => asset('storage/'.$matche->event_b_logo),
                           'title_team_b' => $matche->event_b,
                           'url' => url('/bets/'. base64_encode($matche->id)),
                           'date' => $dataFormatada.' &#x2022; '.$nomeDiaSemana.' &#x2022; '.$horaFormatada,
                           'istoday' => \Carbon\Carbon::parse($matche->event_day)->isToday(),
                           'category' => $matche->betCategory->name
                       ])
                    </div>
                @endforeach
            </div>

            <div class="">
                <div class="col-lg-12">
                    {{ $soccerEvents->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="{{ asset('assets/js/splide.min.js') }}"></script>
    <script>
        document.addEventListener( 'DOMContentLoaded', function () {
            var splide = new Splide( '.splide', {
                type   : 'loop',
                perPage: 4,
                perMove: 1,
                gap : 10,
                arrows: false,
                pagination: false,
                breakpoints: {
                    640: {
                        perPage: 1,
                    },
                }
            } );

            splide.mount();
        } );
    </script>
@endpush
