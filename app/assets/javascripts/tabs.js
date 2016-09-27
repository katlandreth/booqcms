$(document).ready( function(){
  $("li.tab").on("click", function(){
    var post_type_value = $(this).data("post-type");
    $(".content_nav li").removeClass("active_tab");
    $(this).addClass("active_tab");
    $("#post_type_field").val(post_type_value);
    $("form.sort-and-filter").submit();
  });
});
