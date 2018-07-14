function loadRecipes(data) {
  $(".card-header").text(data["name"])
  $(".ingredientsList").text("");
  data["ingredients"].forEach(function(ingredient) {
    name = ingredient.name
    id = ingredient.id
    $(".ingredientsList").append(`<li><a href="/ingredients/${id}">${name}</a></li>`);
  })
  $(".recipeInstructions").text(data["instructions"]);
  // re-set the id to current on the link
  $(".js-next").attr("data-id", data["id"]);
  $(".js-prev").attr("data-id", data["id"]);
}

$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/recipes/" + nextId + ".json", function(data) {
      loadRecipes(data);
    });
    event.preventDefault();
  });

  $(".js-prev").on("click", function() {
    var prevId = parseInt($(".js-prev").attr("data-id")) - 1;
    $.get("/recipes/" + prevId + ".json", function(data) {
      loadRecipes(data);
    });
    event.preventDefault();
  });
});

//
// $(function () {
//   $(".js-next").on("click", function() {
//     var nextId = parseInt($(".js-next").attr("data-id")) + 1;
//     $.get("/recipes/" + nextId + ".json", function(data) {
//       $(".card-header").text(data["name"]);
//       $(".recipeIngredients").text(data["ingredients"]);
//       $(".recipeInstructions").text(data["description"]);
//       // re-set the id to current on the link
//       $(".js-next").attr("data-id", data["id"]);
//     });
//   });
// });
