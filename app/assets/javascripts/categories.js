$(function () {

function Recipe(recipe) {
  this.name = recipe.name
  this.id = recipe.id
}

Recipe.prototype.formatRecipe = function() {
  var recipeHTML = `<p><a href="/recipes/${this.id}">${this.name}</a></p>`
  return recipeHTML
}


$("a.load-recipes").on("click", function() {
  var div = $(".recipes-container")
  var categoryId = this.id

  $.get("/categories/" + categoryId + ".json").success(function(recipes) {
    div.html("")
    recipes.forEach(function(recipe) {
      var oneRecipe = new Recipe(recipe)
      var recipeHTML = oneRecipe.formatRecipe()
      div.append(recipeHTML)
    })
  });
  event.preventDefault();
});
})
