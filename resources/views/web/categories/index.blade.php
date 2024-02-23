@extends('layouts.web')

@push('styles')

@endpush

@section('content')
    <div class="container">
        @include('includes.navbar_left')

        <div class="page__content">
            @include('includes.navbar_top')

            <div class="row">
                <div class="col-lg-6">
                    <h2><img src="{{ asset('storage/'.$category->image) }}" alt="{{ $category->name }}" class="mr-2" width="30"> {{ $category->name }}</h2>
                </div>
                <div class="col-lg-6"></div>
            </div>

            <div class="row mt-3">
                @foreach($games as $game)
                    <div class="col-xl-2 col-lg-2 col-md-3 col-6 caixa-loop-elementos">
                        <a href="{{ route('web.game.index', ['slug' => $game->slug]) }}" class="inner-loop-elementos">
                            <img src="{{ asset('storage/'.$game->image) }}" alt="{{ $game->name }}" class="img-fluid rounded-3">
                        </a>
                    </div>
                @endforeach

            </div>

            <div class="">
                <div class="col-lg-6"></div>
                <div class="col-lg-6">
                    {{ $games->links() }}
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')

@endpush
