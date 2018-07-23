$(function () {

  function Recipe(recipe) {
    this.name = recipe.name
    this.id = recipe.id
  }

  Recipe.prototype.formatRecipe = function() {
    var recipeHTML = `<p><a href="/recipes/${this.id}">${this.name}</a></p>`
    return recipeHTML
  }

  function Category(category) {
    this.id = category.id
    this.name = category.name
  }

  Category.prototype.renderCategory = function() {
    // var categoryHTML = `<a href="#" class="load-recipes"><%= ${this.name} %></a>`
    var categoryHTML = `<li class="list-group-item d-flex justify-content-between align-items-center">
          <a href="#" class="load-recipes" id="${this.id}">${this.name}</a>
          <span class="badge badge-primary badge-pill">0 recipes</span>
        </li>`
    return categoryHTML
  }

  $("form#new_category").on("submit", function() {
    event.preventDefault();
    // var $form = $(this);
    debugger
    var action = this.action;
    var params = $(this).serialize();
    //JSON.stringify - for later
    $.ajax({
      url: action,
      data: params,
      dataType: "json",
      method: "POST"
    }).success(function(json) {
      var category = new Category(json);
      var renderCategory = category.renderCategory();
      $("ul.list-group").append(renderCategory);
    });
  });

  $("a.load-recipes").on("click", function() {
    var div = $(".recipes-container")
    var categoryId = this.id
    $.get("/categories/" + categoryId + ".json").success(function(recipes) {
      div.html("")
      recipes.sort(function(a, b) {
        var nameA = a.name.toUpperCase(); 
        var nameB = b.name.toUpperCase(); 
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        return 0;
      });
      recipes.forEach(function(recipe) {
        var oneRecipe = new Recipe(recipe)
        var recipeHTML = oneRecipe.formatRecipe()
        div.append(recipeHTML)
      })
    });
    event.preventDefault();
  });

  $(".add-new-category").on("click", function() {
      $("#new-category-container").toggle();
    });
    event.preventDefault();
})
