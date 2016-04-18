$(document).ready(function(){
  console.log("loaded script");
  var preview = $(".upload-preview img");

  $(".modal").on('change', '.file', function(event){
  // $(".file").change(function(event){
    console.log("file change");
   var input = $(event.currentTarget);
   var file = input[0].files[0];
   var reader = new FileReader();
   reader.onload = function(e){
     image_base64 = e.target.result;
     preview.attr("src", image_base64);
   };
   reader.readAsDataURL(file);
  });
});
