// $(document).on('click', '.tab-link', function(){
//   console.log("tab link clicked");
//   var wrapper = $('.progress-bar');
//   var progress_bar = $('span.meter');
//   var form = $("#new_medium");
//
//   form.fileupload({dataType: 'script',
//     add: function (e, data) {
//       types = /(\.|\/)(gif|jpe?g|png|bmp)$/i;
//       file = data.files[0];
//       if (types.test(file.type) || types.test(file.name)) {
//         data.submit();
//       }
//       else { alert(file.name + " must be GIF, JPEG, BMP or PNG file"); }
//     }
//   });
//
//   form.on('fileuploadstart', function() {
//     console.log("upload start");
//     wrapper.show();
//   });
//
//   form.on('fileuploaddone', function() {
//     wrapper.hide();
//     progress_bar.width(0); // Revert progress bar's width back to 0 for future uploads
//   });
//
//   form.on('fileuploadprogress', function (e, data) {
//
//     var progress = parseInt(data.loaded / data.total * 100, 10);
//     progress_bar.css('width', progress + '%');
//   });
// });
