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
      blockquote:["\n>", "\n"],
      image:["![alt text](url 'title text')", ""],
      h1:["\n#", "\n"],
      h2:["\n##", "\n"],
      h3:["\n###", "\n"],
      link: ["[", "](url)"]
    };
    var tag = tags[tagName];
    var openTag = tag[0];
    var closeTag = tag[1];

    editor.val(text[0] + openTag + text[2] + closeTag + text[1]);

  }

  //Button Clicks

  $("#bold-button").click({tagName: "bold"}, makeTags);
  $("#italic-button").click({tagName: "italic"}, makeTags);
  $("#blockquote-button").click({tagName: "blockquote"}, makeTags);
  $("#image-button").click({tagName: "image"}, makeTags);
  $("#link-button").click({tagName: "link"}, makeTags);
  $("#h1-button").click({tagName: "h1"}, makeTags);
  $("#h2-button").click({tagName: "h2"}, makeTags);
  $("#h3-button").click({tagName: "h3"}, makeTags);

  //Keyboard Shortcuts

  $(document).keydown(function(e) {
    //cmd + b
    if(e.metaKey && e.keyCode == 66) {
      e.preventDefault();
      e.stopPropagation();
      $("#bold-button").triggerHandler("click");
    }
    //cmd + i
    else if(e.metaKey && e.keyCode == 73) {
      e.preventDefault();
      e.stopPropagation();
      $("#italic-button").triggerHandler("click");
    }
    //cmd + l
    else if(e.metaKey && e.keyCode == 76) {
      e.preventDefault();
      e.stopPropagation();
      $("#link-button").triggerHandler("click");
    }
    //cmd + s
    else if(e.metaKey && e.keyCode == 83) {
      e.preventDefault();
      e.stopPropagation();
      $(".edit_entry").submit();
    }
  });
});
