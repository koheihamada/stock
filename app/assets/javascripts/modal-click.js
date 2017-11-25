$(document).on('turbolinks:load', function() {
  function buildBid(input) {
    var html = `<p class="delete">
                ${input} 円
              </p>`
  $('.modal-h').append(html)
  }

  $('.btn.btn-primary.buy').click(function(){
    var input = $('#buy_price_buy_price').val();
    $('.delete').remove();
    buildBid(input);



  });
});
