# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
- [x ] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
Category has Title
Recipe has ingredients
User has unique email; User has a name
-----> [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
/categories/most_recipes
https://blog.codeship.com/creating-advanced-active-record-db-queries-arel/
https://github.com/rails/arel
http://api.rubyonrails.org/v5.0/classes/ActiveRecord/Scoping/Named/ClassMethods.html#method-i-scope

- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [ x] Include signup (how e.g. Devise)
- [ x] Include login (how e.g. Devise)
- [ x] Include logout (how e.g. Devise)
-----> [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
        https://github.com/kelseyhuse30/drinkmaster/blob/master/app/models/user.rb

- [x ] Include nested resource show or index (URL e.g. users/2/recipes)
-----> [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
Does adding a new category in a new recipe count for this?
- [x ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate


Blog notes:
New technology, old problem
Taking a break for weeks and trying to catch up
Scope method
Future app updates:
-use this as a recipe/budget tracker as well. Include estimated cost of the ingredients, compare to your own weekly budget.
