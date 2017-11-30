$(document).scroll(function() {
    var scroll = $(window).scrollTop();

    if (scroll = 1) {
        $("#header").css('opacity', '1');
    } else {
        $("#header").addClass("topHeader");
    }
});
