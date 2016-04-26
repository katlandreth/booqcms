$(document).ready(function() {
  $('.expander-trigger').click(function(){
    $(this).toggleClass("expander-hidden");
  });

  if($(".expander").has("span.error")) {
    $(this).find(".expander-trigger").removeClass("expander-hidden");
  };

});
