<nav id="navbarContent" class="page__navbar">
    <div class="page__navbar__logo">
        <a class="page__navbar__logo" href="{{ url('/') }}">
            <img src="{{ asset('assets/images/logo.png') }}" alt="" style="max-width:100%">
        </a>

        <button class="navbar-toggler-close close-button" type="button">
            <i class="fa-regular fa-circle-xmark"></i>
        </button>
    </div>
    <div class="navbar_menu_list">
        <ul class="navbar_list">
            <li class="navbar_list_links">
                <a href="{{ url('/') }}" title="Como funciona?">
                    <img src="{{ asset('/assets/images/svg/home2.svg') }}" alt="" width="24">
                    Visão geral
                </a>
            </li>
            <li class="navbar_list_links">
                <a href="{{ url('painel/affiliates') }}" title="Menu de Afiliado">
                    <img src="{{ asset('/assets/images/svg/affiliate.svg') }}" alt="" width="24">
                    Menu de Afiliado
                </a>
            </li>

            <div class="mt-5 navbar_menu_title">
                <h4>JOGOS DA CASA</h4>
            </div>
            @foreach(\App\Models\GameExclusive::limit(5)->orderBy('views', 'desc')->where('active', 1)->get() as $gameExclusive)
                <li class="navbar_list_links">
                    <a href="{{ route('web.vgames.show', ['game' => $gameExclusive->uuid]) }}">
                        <img src="{{ asset('storage/'.$gameExclusive->icon) }}" alt="" width="24">
                        {{ $gameExclusive->name }}
                    </a>
                </li>
            @endforeach

            <div class="mt-5 navbar_menu_title">
                <h4>CATEGORIAS</h4>
            </div>

            @foreach(\App\Models\Category::all() as $category)
                <li class="navbar_list_links">
                    <a href="{{ route('web.category.index', ['slug' => $category->slug]) }}" title="{{ $category->name }}">
                        <img src="{{ asset('storage/'.$category->image) }}" alt="{{ $category->name }}" width="24">
                        {{ $category->name }}
                    </a>
                </li>
            @endforeach

            <div class="mt-5 navbar_menu_title">
                <h4>INFORMAÇÕES</h4>
            </div>

            <li class="navbar_list_links">
                <a href="{{ url('/como-funciona') }}" title="Como funciona?">
                    <img src="{{ asset('assets/images/svg/about.svg') }}" alt="" width="24">
                    Como funciona?
                </a>
            </li>
            {{-- <li class="navbar_list_links">
                <a href="{{ url('/suporte') }}" title="Suporte">
                    <img src="{{ asset('assets/images/svg/suporte.svg') }}" alt="" width="24">
                    Suporte
                </a>
            </li> --}}
            <li class="navbar_list_links">
                <a href="{{ url('/sobre-nos') }}" title="Sobre Nós">
                    <img src="{{ asset('assets/images/svg/sobre.svg') }}" alt="" width="24">
                    Sobre Nós
                </a>
            </li>
        </ul>
    </div>
</nav>
