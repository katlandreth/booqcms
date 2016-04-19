$(function() {
  $(document).on("change", ".modal-state", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open");
    } else {
      $("body").removeClass("modal-open");
      $(".uploaded-image").html("");
    }
  });

  $(".modal-close").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });
});
