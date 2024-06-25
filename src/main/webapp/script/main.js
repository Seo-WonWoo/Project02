$(document).ready(function () {
    // Find Business Swiper
    var findBusinessSwiper = new Swiper('#find_business .business_list', {
        slidesPerView: 'auto',
        spaceBetween: 50,
        centeredSlides: false,
        pagination: {
            el: '#find_business .swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '#find_business .swiper-button-next',
            prevEl: '#find_business .swiper-button-prev',
        },
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
        },
    });

    // Stop autoplay on button click for Find Business Swiper
    $('#find_business .swiper-button-stop').click(function () {
        findBusinessSwiper.autoplay.stop();
    });

    // Business Update Swiper
    var businessUpdateSwiper = new Swiper('#business_update .business_list', {
        slidesPerView: 'auto',
        spaceBetween: 30,
        centeredSlides: false,
        pagination: {
            el: '#business_update .swiper-pagination',
            clickable: true,
        },
        navigation: {
            nextEl: '#business_update .swiper-button-next',
            prevEl: '#business_update .swiper-button-prev',
        },
        autoplay: {
            delay: 5000,
            disableOnInteraction: false,
        },
    });

    // Stop autoplay on button click for Business Update Swiper
    $('#business_update .swiper-button-stop').click(function () {
        businessUpdateSwiper.autoplay.stop();
    });
});
