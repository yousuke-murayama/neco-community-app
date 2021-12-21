/*global $*/

//Mypageのタブ切り替え
$(document).on('turbolinks:load', function() { 
  $(function(){
    $('.tab').click(function(){
      $('.tab-active').removeClass('tab-active');
      $(this).addClass('tab-active');
      $('.content-show').removeClass('content-show');
      const index = $(this).index();
      $('.tab-content').eq(index).addClass('content-show');
    });
  });
});

