$(document).ready(function() {
  var video_embed_markup;

  function create_video_markup(){
    var video_url = $("#video_url_field").val();
    video_embed_markup = $.trim('<div class="video">\n \
  <div class="video-wrapper">\n \
    <iframe src="'+ video_url +'"frameborder="0" allowfullscreen></iframe>\n \
  </div>\n \
</div>');
  };

  $(".video_embed_form .submit").on("click", function() {
    create_video_markup();
    alert(video_embed_markup);
  });

var dragComponent = document.getElementById('content-component-video');

dragComponent.ondragstart = function(evt) {
    evt.dataTransfer.setData("text/plain", video_embed_markup);
};

dragComponent.onclick = function(evt) {
    evt.preventDefault();
};

});
