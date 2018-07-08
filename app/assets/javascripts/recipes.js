// var Recipe = function (attributes) {
//   this.name = name
//   this.instructions = instructions
//   this.ingredients = ingredients
// }
//
// Recipe.prototype.renderRecipe = function() {
//   recipeHTML = ""
//   recipeHTML =  `<li><blockquote>${this.name}<footer> by: ${this.user}</footer></blockquote></li>`
//   return recipeHTML
//   };
//
// $( document ).ready(function() {
//   $("a.load_recipes").on("click",function(e) {
//     $.get(this.href).success(function(recipes) {
//       console.log(recipes)
//       var $ul = $("div#recipes")
//       $ul.html(recipes)
//
//       // recipes.forEach(function(recipe) {
//       //   const oneRecipe = new Recipe(recipe)
//       //   const recipeHTML = oneRecipe.formatRecipe()
//       //   $ul.append(recipeHTML)
//       // })
//     });
//     e.preventDefault();
//   })
// });
