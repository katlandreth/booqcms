$(document).ready(function(){
  $("#image-library-modal").on('click', '.upload-submit', function(){
    console.log("upload clicked");
    NProgress.start();
    NProgress.inc();
    console.log("upload done");
  });
});
