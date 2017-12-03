$(function() {
  $('#pay').on('click', function() {
    $('#overlay, #modalWindow').fadeIn();
  });

  $('#end, #close').on('click', function() {
    $('#overlay, #modalWindow').fadeOut();
  });

  locateCenter();
  $(window).resize(locateCenter);

  function locateCenter() {
    let w = $(window).width();
    let h = $(window).height();

    let cw = $('#modalWindow').outerWidth();
    let ch = $('#modalWindow').outerHeight();

    $('#modalWindow').css({
      'left': ((w - cw) / 2) + 'px',
      'top': ((h - ch) / 2) + 'px'
    });
  }
});
