$(document).ready(function() {
  var video_embed_markup;
  var video_thumbnail;

  $(".video_embed_form .submit").on("click", function() {
    create_video_markup();
    get_video_thumbnail();
    $(this).addClass("component-created").text("drag the video into place");
    $(".youtube-component-thumb").replaceWith(video_thumbnail);
  });

  function create_video_markup(){
    var video_id = $("#video_id_field").val();
    video_embed_markup = $.trim('<div class="video">\n \
  <div class="video-wrapper">\n \
    <iframe src="https://www.youtube.com/embed/'+ video_id +
    ' "frameborder="0" allowfullscreen></iframe>\n \
  </div>\n \
</div>');
  };

  function get_video_thumbnail() {
    var video_id = $("#video_id_field").val().trim();
    video_thumbnail = $.trim('<img src="http://img.youtube.com/vi/'+ video_id +
    '/mqdefault.jpg" class="youtube-component-thumb"/>');
  };

  var dragComponent = document.getElementById('content-component-video');

  dragComponent.ondragstart = function(evt) {
    evt.dataTransfer.setData("text/plain", video_embed_markup);
  };

  dragComponent.onclick = function(evt) {
    evt.preventDefault();
  };

  $(".textarea-body").on("drop", function(evt) {
    $(".video_embed_form .submit").removeClass("component-created").text("submit");
  });

});
