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

//捜索願のプレビュー
$(function(){
    $("#preview").on("change", function(){
      let selectedFile = this.files[0];
      let fileReader = new FileReader();
      
      fileReader.onload = function(e){
        $(".preview_wanted").attr("src", e.target.result);
      };
      
      fileReader.readAsDataURL(selectedFile);
    });
});

//アイコン画像のプレビュー
$(function(){
    $("#preview_icon").on("change", function(){
      let selectedIcon = this.files[0];
      let fileReader = new FileReader();
      
      fileReader.onload = function(e){
        $(".user-icon").attr("src", e.target.result);
      };
      
      fileReader.readAsDataURL(selectedIcon);
    });
});