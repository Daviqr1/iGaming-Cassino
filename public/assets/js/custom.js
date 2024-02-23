$(document).ready(function() {
    $('.navbar-toggler').click(function() {
        $('.page__navbar').slideToggle(300);  // 300 é a duração da animação em milissegundos
        $('.page__navbar').toggleClass('full-width'); // Adiciona/remova a classe 'full-width'
    });
    $('.close-button').click(function() {
        $('.page__navbar').slideToggle(100);  // 300 é a duração da animação em milissegundos
        $('.page__navbar').toggleClass('full-width'); // Adiciona/remova a classe 'full-width'
    });
});
