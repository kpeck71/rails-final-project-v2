class Recipe < ApplicationRecord
  belongs_to :user, :counter_cache => true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :category_recipes
  has_many :categories, through: :category_recipes
  validates_presence_of :name, :ingredients, :instructions
  validates_uniqueness_of :name

  def ingredients_attributes=(ingredients_attributes)
    # self.ingredients.delete_all

    ingredients_attributes.values.each do |ingredient_attribute|
      ingredient_name = ingredient_attribute[:name]
      ingredient = Ingredient.find_or_create_by(name: ingredient_name)
      if !ingredient_name.empty? && ingredient
         self.ingredients << ingredient unless self.ingredients.include?(ingredient)
      end
      self.save
    end
  end

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      if !category_attribute[:name].empty? && category = Category.find_or_create_by(category_attribute)
       self.categories << category
      end
    end

  end

  def self.most_ingredients
    left_joins(:ingredients)
    .group(:id)
    .order('COUNT(ingredients.id) DESC')
    .limit(1)
  end


  def self.search(search)
    joins(:ingredients).where({ingredients: { name: "#{search}" }})
  end
  #
  # if params[:search]
  #   @recipes = Recipe.search(params[:search])
  #   raise @recipes.inspect
    #<ActiveRecord::Relation [#<Recipe id: 3, name: "Caprese Salad", user_id: 2, instructions: "Combine">,
    #<Recipe id: 4, name: "Kale Flatbread", user_id: 2, instructions: "Combine">,
    #<Recipe id: 4, name: "Kale Flatbread", user_id: 2, instructions: "Combine">,
    #<Recipe id: 4, name: "Kale Flatbread", user_id: 2, instructions: "Combine">]>

  #MySQL uses LIKE ? Heroku or another platform that uses PostgreSQL uses  ILIKE
#where("name LIKE ? OR ingredients LIKE ? OR instructions LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
#joins.([:ingredients].where("name LIKE ?", "%#{search}%")


end
