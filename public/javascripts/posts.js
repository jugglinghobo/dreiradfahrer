(function() {

  function replaceLayout(event, object) {
    $("#layout").html(object.responseText);
  }

  $("#post-layout-form").on("ajax:complete", replaceLayout);
})();
