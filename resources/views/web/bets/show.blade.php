@extends('layouts.web')

@section('title', $event->betCategory->name .' - '.$event->event_a .' x '.$event->event_b)

@section('seo')
    <link rel="canonical" href="{{ url()->current() }}" />
    <meta name="description" content="Descubra o emocionante mundo das apostas em jogos de futebol na SPCASSINO, o melhor cassino online. Tenha acesso a uma ampla seleção de jogos de slot e desfrute de uma experiência de apostas única. Venha torcer pelo seu time e ganhar prêmios incríveis!">
    <meta name="keywords" content="{{ $event->event_a }}, {{ $event->event_b }}, Apostas em jogos de futebol, Cassino Online, Jogos de Slot, Apostas Esportivas, Apostas de Futebol, Cassino SPCASSINO">

    <meta property="og:locale" content="pt_BR" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="{{ $event->betCategory->name .' - '.$event->event_a .' x '.$event->event_b }}" />
    <meta property="og:description" content="Descubra o emocionante mundo das apostas em jogos de futebol na SPCASSINO, o melhor cassino online. Tenha acesso a uma ampla seleção de jogos de slot e desfrute de uma experiência de apostas única. Venha torcer pelo seu time e ganhar prêmios incríveis!" />
    <meta property="og:url" content="{{ url()->current() }}" />
    <meta property="og:site_name" content="{{ $event->betCategory->name .' - '.$event->event_a .' x '.$event->event_b }}" />
    <meta property="og:image" content="{{ asset('/assets/images/banner-1.png') }}" />
    <meta property="og:image:secure_url" content="{{ asset('/assets/images/banner-1.png') }}" />
    <meta property="og:image:width" content="1024" />
    <meta property="og:image:height" content="571" />

    <meta name="twitter:title" content="{{ $event->betCategory->name .' - '.$event->event_a .' x '.$event->event_b }}">
    <meta name="twitter:description" content="Descubra o emocionante mundo das apostas em jogos de futebol na SPCASSINO, o melhor cassino online. Tenha acesso a uma ampla seleção de jogos de slot e desfrute de uma experiência de apostas única. Venha torcer pelo seu time e ganhar prêmios incríveis!">
    <meta name="twitter:image" content="{{ asset('/assets/images/banner-1.png') }}"> <!-- Substitua pelo link da imagem que deseja exibir -->
    <meta name="twitter:url" content="{{ url('/') }}"> <!-- Substitua pelo link da sua página -->
@endsection

@push('styles')

@endpush

@section('content')
    <div class="container">
        @include('includes.navbar_left')

        <div class="page__content">
            @include('includes.navbar_top')

            <div class="relative soccer"  style="margin-bottom: 50px">
                <div class="soccer-bg overlay" style="background-image: url({{ asset('storage/'.$event->cover) }});"></div>
                <div class="soccer-container">
                    @php
                        $createdAt = \Carbon\Carbon::parse($event->event_day);

                        $dataFormatada = $createdAt->format('d/m');

                        $nomeDiaSemana = $createdAt->translatedFormat('l');

                        $horaFormatada = $createdAt->format('H:i');
                    @endphp
                    <div class="soccer-date">
                        <h2>{{ $dataFormatada  }}</h2>&#x2022;
                        <h2 class="">{{ ucfirst($nomeDiaSemana) }}</h2>&#x2022;
                        <h2>{{ $horaFormatada }}</h2>
                    </div>
                    <div class="soccer-team">
                        <div class="soccer-logo">
                            <img src="{{ asset('storage/'.$event->event_a_logo) }}" width="100" alt="" class="img-fluid">
                        </div>
                        <div class="soccer-info">
                            <h2>{{ $event->event_a }} <span>VS.</span> {{ $event->event_b }}</h2>
                            <p>{{ $event->betCategory->name }}</p>
                        </div>
                        <div class="soccer-logo">
                            <img src="{{ asset('storage/'.$event->event_b_logo) }}"  width="100" alt="" class="img-fluid">
                        </div>
                    </div>
                    <div class="soccer-form">
                        <form id="betForm" action="{{ route('web.bets.store') }}" method="post">
                            @csrf
                            @method('post')
                            <input type="hidden" name="bet_event_id" value="{{ $event->id }}">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text text-uppercase" id="basic-addon1" style="min-width: 200px;">
                                            <img src="{{ asset('storage/'.$event->event_a_logo) }}" width="28" alt="" class="img-fluid " style="margin-right: 10px"> {{ $event->event_a }}
                                        </span>
                                        <input type="number" name="event_result_a" class="form-control @error('event_result_a') is-invalid @enderror" required placeholder="Placar?" value="{{ old('event_result_a') }} ?? 0">
                                    </div>
                                    @error('event_result_a')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-lg-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text text-uppercase" id="basic-addon1" style="min-width: 200px;">
                                            <img src="{{ asset('storage/'.$event->event_b_logo) }}" width="28" alt="" class="img-fluid " style="margin-right: 10px"> {{ $event->event_b }}
                                        </span>
                                        <input type="number" name="event_result_b" class="form-control @error('event_result_b') is-invalid @enderror" required placeholder="Placar?" value="{{ old('event_result_b') }} ?? 0" >
                                    </div>
                                    @error('event_result_b')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>

                                <div class="col-lg-4">
                                    <div class="input-group mb-3">
                                        <span class="input-group-text" id="basic-addon1" style="min-width: 200px;">DIGITE O VALOR - R$</span>
                                        <input type="text" name="amount" min="10" required class="form-control @error('amount') is-invalid @enderror" placeholder="Aposta " value="{{ old('amount') }}">
                                    </div>
                                    @error('amount')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-lg-4">
                                    <p>18+. Jogo responsável.</p>
                                </div>
                                <div class="col-lg-4">
                                    @if(auth()->check())
                                        @if(strtotime($event->event_day) > strtotime(now()))
                                            <button type="submit" class="page__content__navbar__dir__btn w-full">Apostar agora</button>
                                        @else
                                            <button class="btn w-full" disabled> Apostas finalizadas</button>
                                        @endif
                                    @else
                                        <button class="btn w-full" disabled> Faça login para apostar</button>
                                    @endif
                                </div>
                                <div class="col-lg-4">

                                </div>
                            </div>

                        </form>
                    </div>
                    @if(count($bets))
                        <div class="soccer-bets">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">Apostador</th>
                                            <th scope="col">Valor</th>
                                            <th scope="col">Resultado</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($bets as $bet)
                                            <tr>
                                                <td>
                                                    @if(auth()->check() && auth()->user()->id == $bet->user->id)
                                                        {{ $bet->user->name }}
                                                    @else
                                                        {{ \Helper::hideString($bet->user->name) }}
                                                    @endif
                                                </td>
                                                <td>{{  \Helper::amountFormatDecimal($bet->amount) }}</td>
                                                <td>{{ $bet->event_result_a }}x{{ $bet->event_result_b }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    @endif
                    @if($event->betsAmountsWithPercent > 0)
                        <div class="soccer-award">
                            <div class="row">
                                <div class="col-lg-4"></div>
                                <div class="col-lg-4">
                                    <div class="soccer-info text-center">
                                        <h2>{{ \Helper::amountFormatDecimal($event->betsAmountsWithPercent) }}</h2>
                                        <p class="text-uppercase"><i class="fa-duotone fa-trophy mr-2"></i> prêmio do vencedor</p>
                                    </div>
                                </div>
                                <div class="col-lg-4 ">
                                    @if($bets->hasPages())
                                        <nav aria-label="" style="float: right;">
                                            <ul class="pagination">
                                                <li class="page-item">
                                                    <a class="page-link" href="{{ $bets->previousPageUrl() }}" aria-label="Previous">
                                                        <i class="fa-light fa-angle-left"></i>
                                                    </a>
                                                </li>
                                                <li class="page-item">
                                                    @if($bets->hasMorePages())
                                                        <a class="page-link" href="{{ $bets->nextPageUrl()	 }}" aria-label="Next">
                                                            <i class="fa-light fa-angle-right"></i>
                                                        </a>
                                                    @endif
                                                </li>
                                            </ul>
                                        </nav>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endif

                    <div class="alert alert-info">
                        <p><strong>Como o sistema opera?</strong></p>
                        <p>
                            <small>
                                O prêmio é distribuído entre os vencedores com base no valor apostado, após a dedução de uma taxa de plataforma de 30%. Cada ganhador receberá uma notificação
                                informando o valor que conquistou. Se ninguém acertar, o prêmio é compartilhado entre os apostadores. Importante ressaltar que somente é permitido fazer
                                apostas com o valor depositado, uma vez que os bônus recebidos são destinados exclusivamente aos nossos jogos.
                            </small>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script>

    </script>
@endpush
