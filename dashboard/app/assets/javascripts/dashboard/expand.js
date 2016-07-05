$(document).ready(function() {
  $('.expander-trigger').click(function(){
    $(this).toggleClass("expander-hidden");
  });

  if($(".expander").has("span.error").length > 0) {
    console.log($("span.error"));
    $(this).find(".expander-trigger").removeClass("expander-hidden");
  };

});
