function removePosts() {
  $(".content_nav li").removeClass("active_tab");
  $("#tutorials_tab").addClass("active_tab");
  $(".post_card_wrapper").fadeOut(700).promise().done(function(){
    $(this).remove();
    addPosts();
  });
};

function addPosts() {
  $(".posts").append("<%= escape_javascript(render partial: 'posts', locals: { posts: @posts, post_type: @post_type } ) %>").hide().fadeIn(500);
  $("#post_type_field").val("<%=@posts.first.post_type%>");
};

removePosts();
