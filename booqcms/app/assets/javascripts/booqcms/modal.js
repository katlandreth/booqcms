$(function() {
  $(document).on("change", ".modal-state", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open");
    } else {
      $("body").removeClass("modal-open");
    }
  });

  $(".modal-close").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });
});
