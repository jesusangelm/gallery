$(document).ready(function() {

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('.inline-hints img', $(input).parent()).attr('src', e.target.result).attr("style", "width:300px;height:200px");
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#picture_image_input").on("change","input[type='file']", function() {
    readURL(this);
  });

});
