$(document).ready(function(){
  var editor = $("#entry_payload");

  function getSelected(){
    var u      = editor.val();
    var start  = editor.get(0).selectionStart;
    var end    = editor.get(0).selectionEnd;
    console.log("get selected");
    return [u.substring(0, start), u.substring(end), u.substring(start, end)];
  }

  function makeTags(event){
    var tagName = event.data.tagName;
    var text = getSelected()
    var tags = {
      bold:["**", "**"],
      italic:["_", "_"],
      blockquote:[">", "\n"],
      image:["**", "**"],
      h1:["#", "\n"],
      h2:["##", "\n"],
      h3:["###", "\n"]
    };
    var tag = tags[tagName];
    var openTag = tag[0];
    var closeTag = tag[1];

    editor.val(text[0] + openTag + text[2] + closeTag + text[1]);

  }

  $("#bold-button").click({tagName: "bold"}, makeTags);
  $("#italic-button").click({tagName: "italic"}, makeTags);
  $("#blockquote-button").click({tagName: "blockquote"}, makeTags);
  $("#image-button").click({tagName: "image"}, makeTags);
  $("#h1-button").click({tagName: "h1"}, makeTags);
  $("#h2-button").click({tagName: "h2"}, makeTags);
  $("#h3-button").click({tagName: "h3"}, makeTags);

});
