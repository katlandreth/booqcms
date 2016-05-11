$(document).ready(function() {
  var form = $("form.sort-and-filter");
  console.log("in the filter function");
  form.each(function(i, el) {
    $('input[type=submit]', el).hide();
    $('select', el).on('change', function(ev) {
      $(el).submit();
    });
  });
});
