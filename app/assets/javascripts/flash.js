$(function() {
  $(document).scroll(function() {
      var scroll = $(window).scrollTop();

      if (scroll = 1) {
          $('.flash').fadeOut();
        }
  });
});
