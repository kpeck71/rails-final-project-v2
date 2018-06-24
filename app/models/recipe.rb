class Recipe < ApplicationRecord
  belongs_to :user, :counter_cache => true
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :category_recipes
  has_many :categories, through: :category_recipes
  validates_presence_of :name, :ingredients, :instructions

  # accepts_nested_attributes_for :ingredients,
  #   :allow_destroy => true,
  #   :reject_if => :all_blank
  # end

  def recipe_ingredients_attributes=(recipe_ingredients_attributes)

    recipe_ingredients_attributes.values.each do |ingredient_attribute|
      name = ingredient_attribute[:ingredient][:name]
       if !name.empty? && ingredient = Ingredient.find_or_create_by(name: name)
         self.ingredients << ingredient
         self.save
         self.recipe_ingredients.find_or_create_by(notes: ingredient_attribute[:notes], recipe_id: self.id, ingredient_id: ingredient.id)
         self.save
       end
    end
  end
#Does not seem DRY

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      if !category_attribute[:name].empty? && category = Category.find_or_create_by(category_attribute)
       self.categories << category
      end
    end

  end

  def self.search(search)
    joins(:ingredients).where({ingredients: { name: "%#{search}%" }})
    #where returns an activerecord relation
  end

  #MySQL uses LIKE ? Heroku or another platform that uses PostgreSQL uses  ILIKE
#where("name LIKE ? OR ingredients LIKE ? OR instructions LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
#joins.([:ingredients].where("name LIKE ?", "%#{search}%")


end
