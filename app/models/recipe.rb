class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :category_recipes
  has_many :categories, through: :category_recipes
  validates :name, presence: true
  # accepts_nested_attributes_for :ingredients,
  #   :allow_destroy => true,
  #   :reject_if => :all_blank
  # end

  def ingredients_attributes=(ingredients_attributes)
    self.ingredients.destroy_all

    ingredients_attributes.values.each do |ingredient_attribute|
       ingredient = Ingredient.find_or_create_by(ingredient_attribute) unless ingredient_attribute[:name].empty?
       self.ingredients.build(ingredient_attribute)
    end
  end
end
