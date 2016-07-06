$(document).on('click', '.seo-word', function(){
  var word = $(this).html();
  function onInputRegex(input) {
    return new RegExp(word, 'gi');
  }
  $('textarea#entry_payload').highlightWithinTextarea(onInputRegex);
});

$(document).on('click', '.clear-highlighting', function(){
  $('textarea#entry_payload').data('hwt').destroy();
});
