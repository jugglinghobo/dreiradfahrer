(function() {

  function replaceLayout(event, object) {
    $("#layout").html(object.responseText);
  }

  $("#post-layout-form").off("ajax:success", replaceLayout);
  $("#post-layout-form").on("ajax:success", replaceLayout);

  $("#post-layout-form").on("ajax:complete", replaceLayout);

})();
