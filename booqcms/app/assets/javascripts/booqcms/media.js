$(document).on("click", ".image-gallery .gallery-thumb-wrapper", function(){
  $(".selected").removeClass("selected");
  $(this).addClass("selected");
});
