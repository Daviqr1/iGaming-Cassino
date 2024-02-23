<div class="footer">
    <div class="row">
        <div class="col-lg-6 col-sm-12">
            <div class="footer-info">
                <div>
                    <img src="{{ asset('assets/images/logo.png') }}" alt="" class="footer-logo" width="">
                    <img src="{{ asset('/assets/images/+18.png') }}" alt="" width="38">
                </div>
                <p class="{{ url('/sobre-nos') }}">
                    <strong>{{ getenv('APP_NAME') }}</strong> é uma comunidade dedicada a oferecer a melhor experiência aos jogadores.
                    Estamos confiantes de que o JOGUINHO revolucionará a indústria de cassinos online.
                    Experimente! Divirta-se jogando e conquiste vitórias!
                </p>
            </div>
        </div>
        <div class="col-lg-6 col-sm-12">

            <div class="footer-right">

                <div class="footer-social">
                    <div class="row">
                        <div class="col">
                            <a href="https://www.instagram.com/#" target="_blank">
                                <img src="{{ asset('/assets/images/social/instagram.png') }}" alt="">
                            </a>
                        </div>
                        <div class="col">
                            <a href="">
                                <img src="{{ asset('/assets/images/social/discord.png') }}" target="_blank" alt="">
                            </a>
                        </div>
                        <div class="col">
                            <a href="">
                                <img src="{{ asset('/assets/images/social/telegram.png') }}" target="_blank" alt="">
                            </a>
                        </div>
                        <div class="col">
                            <a href="">
                                <img src="{{ asset('/assets/images/social/twitter.png') }}" target="_blank" alt="">
                            </a>
                        </div>
                    </div>
                </div>
                ©{{ date('Y') }} {{ env('APP_NAME') }} TODOS OS DIREITOS RESERVADOS
            </div>
        </div>
    </div>

</div>



