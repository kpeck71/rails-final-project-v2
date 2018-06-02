class Category < ApplicationRecord
  has_many :category_recipes
  #has_many :recipes, through: :category_recipes
  has_many :recipes, -> {order 'recipes.count'}, through: :category_recipes
  validates :name, presence: true
  validates_uniqueness_of :name

   # scope :sort_by_popularity, -> { order("categories.recipes_count DESC") }
   scope :sort_ABC, -> { order("NAME ASC")}


  def recipes_count
    self.recipes.count
  end

#   has_many :users, -> { order 'users.last_name, users.first_name' }, :through => :assignments
#   has_many :recipes, -> { order 'recipes' }, :through => :category_recipes


end
