$(function () {
  $("a.new-note").on("click", function() {
      var idFoo = $(this).attr('recipe-ing-id')
      var noteContainer = $(this).next();
      noteContainer.toggle();
    });
    event.preventDefault();
  });
