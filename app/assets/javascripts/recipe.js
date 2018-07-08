$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/recipes/" + nextId + ".json", function(data) {
      $(".card-header").text(data["recipe"]["name"]);
      $(".recipeIngredients").text(data["ingredients"]);
      $(".recipeInstructions").text(data["description"]);
      // re-set the id to current on the link
      $(".js-next").attr("data-id", data["id"]);
    });
  });
});
