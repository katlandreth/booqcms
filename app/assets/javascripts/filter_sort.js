$(document).ready(function() {
  var form = $("form.sort-and-filter");
  form.each(function(i, el) {
    // $('input[type=submit]', el).hide();
    $('select', el).on('change', function(ev) {
      $(el).submit();
    });
  });
});
