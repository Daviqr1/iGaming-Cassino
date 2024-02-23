@extends('layouts.web')

@section('title', 'SPCASSINO - Cassino Online | Jogos de Slot e Apostas em Futebol')

@section('seo')
    <link rel="canonical" href="{{ url()->current() }}" />
    <meta name="description" content="Bem-vindo à SPCASSINO - o melhor cassino online com uma ampla seleção de jogos de slot, apostas em jogos de futebol e uma experiência de aposta fácil e divertida. Jogue Fortune Tiger, Fortune OX e muito mais!">
    <meta name="keywords" content="SPCASSINO, cassino online, jogos de slot, apostas em futebol, Fortune Tiger, Fortune OX">

    <meta property="og:locale" content="pt_BR" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="SPCASSINO - Apostas Online | Jogos de Slot e Apostas em Futebol" />
    <meta property="og:description" content="Bem-vindo à SPCASSINO - o melhor cassino online com uma ampla seleção de jogos de slot, apostas em jogos de futebol e uma experiência de aposta fácil e divertida. Jogue Fortune Tiger, Fortune OX e muito mais!" />
    <meta property="og:url" content="{{ url()->current() }}" />
    <meta property="og:site_name" content="SPCASSINO - Apostas Online | Jogos de Slot e Apostas em Futebol" />
    <meta property="og:image" content="{{ asset('/assets/images/banner-1.png') }}" />
    <meta property="og:image:secure_url" content="{{ asset('/assets/images/banner-1.png') }}" />
    <meta property="og:image:width" content="1024" />
    <meta property="og:image:height" content="571" />

    <meta name="twitter:title" content="SPCASSINO - Apostas Online | Jogos de Slot e Apostas em Futebol">
    <meta name="twitter:description" content="Bem-vindo à SPCASSINO - o melhor cassino online com uma ampla seleção de jogos de slot, apostas em jogos de futebol e uma experiência de aposta fácil e divertida. Jogue Fortune Tiger, Fortune OX e muito mais!">
    <meta name="twitter:image" content="{{ asset('/assets/images/banner-1.png') }}"> <!-- Substitua pelo link da imagem que deseja exibir -->
    <meta name="twitter:url" content="{{ url('/') }}"> <!-- Substitua pelo link da sua página -->
@endsection

@push('styles')
    <link rel="stylesheet" href="{{ asset('assets/css/splide-core.min.css') }}">
@endpush

@section('content')
<div class="container">
        @include('includes.navbar_left')
	<div class="page__content">
		<div class="row">

			<div class="game-fullscreen col-lg-12 col-md-12 col-sm-12 col-xs-12" data-fullscreen="">
				<div class="d-steam-cards js-steamCards">
					<a href="{{ route('web.kscinus.go', ['game' => $game->key, 'type' => $game->type]) }}" class="d-steam-card-wrapper">
						<div class="d-steam-card js-steamCard" style="background-image: url('/storage/{{ $game->cover }}')"></div>
					</a>
				</div>
			</div>
		</div>
		<div class="game-details row">
			<div class="col-lg-12 col-md-9 col-sm-8 col-xs-12">
				<h1 class="game-details__title">{{ $game->title }}</h1>
				<div class="game-details__description">
					<p>{{ $game->description }}</p>
				</div>
			</div>
		</div>
		<div class="stats-and-social row">
			<div class="basic-game-stats col col-xs-6">
				<p class="basic-game-stats__header">Informação básica do Jogo</p>
				<ul class="basic-game-stats__numbers">
					<li>RTP e volatilidade:
						<span>{{ $game->rtp }}%</span>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
@endsection
