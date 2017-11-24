$(document).on('turbolinks:load', function() {
  $('.single-item').slick({
    accessibility: true,
    adaptiveHeight: false,
    autoplay: true,
    autoplaySpeed: 2000,
    dots: false,
    fade: true,
  });
});
