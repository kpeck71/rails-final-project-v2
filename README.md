# README

<h1>Recipe Manager</h1>
Create a user account at /signup, or log in with Google at /login. Then browse recipes and create/edit your own recipe. Recipes include a recipe name, ingredients, and optional categories (e.g. Vegetarian, Dessert, Potluck). A user can browse all recipes from all users and view/edit their own recipes. Only a recipe's creator can edit the recipe, and only logged-in users can view the details of other user's recipes.

You can also sort users by the users with the most recipes ("Most Prolific"). /users/most_recipes

When browsing categories, you can sort by name or most popular. /categories
Users can also view the number of recipes for each category, and view all recipes that fall under that category. /recipes

For ingredients, users can see how many recipes use that ingredient from the index page. Click the ingredient to see all recipes that contain the ingredient. /ingredients

#Start Here

To run on local system using web browser (localhost:3000), fork and clone the repository, run bundle install –without production, rake db:migrate, rake db:seed


## Contributing
The app is available as open source under the terms of the <a href="https://opensource.org/licenses/MIT">MIT License</a>.

Bug reports and pull requests are welcome on GitHub at https://github.com/kpeck71/rails-final-project-v2
