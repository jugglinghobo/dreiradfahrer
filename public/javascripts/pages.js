(function() {

  var replaceLayout = function() {
    var form = $(this);
    var path = select.data('path') + '?layout='+select.val();
    console.log(path);
    $("#post_form").find("#layout").load(path);
  }

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
        debugger;
      }
    });
  }

  var replaceLayout = function(a, b, c) {
    $("#layout").html(a);
  }

  $("#layout_select").off("change", submitForm);
  $("#layout_select").on("change", submitForm);

})();
