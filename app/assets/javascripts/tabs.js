$(document).ready( function(){
  console.log("inside tab.js");
  $("li.tab").on("click", function(){
    console.log("tab clicked");
    var post_type_value = $(this).data("post-type");
    console.log(post_type_value);
    $(".content_nav li").removeClass("active_tab");
    $(this).addClass("active_tab");
    $("#post_type_field").val(post_type_value);
    $("form.sort-and-filter").submit();
  });
});
