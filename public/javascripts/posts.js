(function() {

  function replaceLayout(event, object) {
    $("#layout").html(object.responseText);
  }

  function movePostUp(event) {
    var lowerPost = $(this).parents('.post');
    var higherPost = lowerPost.prev('.post');
    if (higherPost.length) {
      switchPosts(higherPost, lowerPost);
    }
  }

  function movePostDown(event) {
    var higherPost = $(this).parents('.post');
    var lowerPost = higherPost.next('.post');
    if (lowerPost.length) {
      switchPosts(higherPost, lowerPost);
    }
  }

  function switchPosts(first, second) {
    switchNumbers(first, second)
    first.insertAfter(second);
  }

  function switchNumbers(first, second) {
    firstNumberInput = first.find('input.post-number');
    firstNumber = firstNumberInput.val();
    secondNumberInput = second.find('input.post-number');
    firstNumberInput.val(secondNumberInput.val());
    secondNumberInput.val(firstNumber);
  }

  $("#post-layout-form").on("ajax:complete", replaceLayout);

  $(".post").off('click', '.move-up', movePostUp);
  $(".post").on('click', '.move-up', movePostUp);

  $(".post").off('click', '.move-down', movePostDown);
  $(".post").on('click', '.move-down', movePostDown);
})();
