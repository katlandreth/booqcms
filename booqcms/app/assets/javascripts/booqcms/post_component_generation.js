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

function setCaretPosition(e, elemId, text) {
  var elem = document.getElementById(elemId);
  var range = document.createRange();
  var sel = window.getSelection();
  var caretPosition = document.caretPositionFromPoint(e.clientX, e.clientY);
  var textNode = caretPosition.offsetNode
  var offset = caretPosition.offset
  console.log(caretPosition);
  if(elem != null) {
    if (textNode.nodeType == 3) {
        var replacement = textNode.splitText(offset);
        var br = document.createElement('br');
        range.setStart(textNode, offset);
        $('.droppable').droppable({
          drop: function() {
            textNode.parentNode.insertBefore(br, replacement);
            range.insertNode( document.createTextNode(text) );
          }
        });
      }
      else{
        $('.droppable').droppable({
          drop: function() {
            elem.appendChild( document.createTextNode(text) );
          }
        });
      }
    }
  }


  $(function() {
    $( "#Capa_1" ).draggable({ revert: "valid" });
    //  $('.droppable').droppable({
    //   over: function( event, ui ) {
    //     setCaretPosition(event, 'droppable-body', video_embed_markup);
    //   }
    // });
    $('.droppable').mousemove(function( event ) {
      setCaretPosition(event, 'droppable-body', video_embed_markup);
    });
  });

});
