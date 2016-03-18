(function() {

  var submitForm = function(e){
    e.preventDefault();
    var form = $(this.form);
    $.ajax({
      url: form.attr("action"),
      method: 'PUT',
      data: form.serialize(),
      success: replaceLayout,
      error: function(a, b, c) {
        console.log('error');
      }
    });
  }

  var replaceLayout = function(content, status, xhr) {
    $("#layout").html(content);
  }

  $("#layout_select").off("change", submitForm);
  $("#layout_select").on("change", submitForm);

})();
