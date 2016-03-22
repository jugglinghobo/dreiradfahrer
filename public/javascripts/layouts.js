(function() {
  function triggerFileUploadDialog(e) {
    $(this).parent().find('.hidden-file-field input').trigger('click');
  }

  $(document).on('ready', function() {
    $(".file-field-trigger").off('click', triggerFileUploadDialog)
    $(".file-field-trigger").on('click', triggerFileUploadDialog)
  });
})();
