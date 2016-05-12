function removePosts() {
  $(".post_card_wrapper").fadeOut(700).promise().done(function(){
    $(this).remove();
    addPosts();
  });
};

function addPosts() {
  $(".posts").append("<%= escape_javascript(render partial: 'posts', locals: { posts: @posts } ) %>").hide().fadeIn(500);
};

removePosts();
