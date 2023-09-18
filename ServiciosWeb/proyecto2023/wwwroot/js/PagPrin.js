//menu para mobiles

function copyMenu() {
    //copiar inside .dpt-cat a .departments
    var dptCategory = document.querySelector('.dpt-cat');
    var dptPlace = document.querySelector('.departments');
    dptPlace.innerHTML = dptCategory.innerHTML;

    //copiar inside nav a nav

    var mainNav = document.querySelector('.header-nav nav');
    var navPlace = document.querySelector('.off-canvas nav')
    navPlace.innerHTML = mainNav.innerHTML;

    //copiar header-top .wrapper a .thetop-nav

    var topNav = document.querySelector('.header-top .wrapper');
    var topPlace = document.querySelector('.off-canvas .thetop-nav')
    topPlace.innerHTML = topNav.innerHTML;


}
copyMenu();


//menu mobil

const menuButton = document.querySelector('.trigger'),
    closeButton = document.querySelector('.t-close'),
    addclass = document.querySelector('.site');


menuButton.addEventListener('click', function () {
    addclass.classList.toggle('showmenu')
})

closeButton.addEventListener('click', function () {
    addclass.classList.remove('showmenu')
})





//slider

const swiper = new Swiper('.swiper', {
    // Optional parameters
    loop: true,

    // If we need pagination
    pagination: {
        el: '.swiper-pagination',
    },


});












