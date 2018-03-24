class Category < ApplicationRecord
  has_many :category_recipes
  has_many :recipes, through: :category_recipes

  # def most_popular
  #   scope :most_popular, -> { joins(:category_recipes).where('category_id.count.maximum') }
  #   # SELECT  "category_id".* FROM "category_recipes" ORDER BY "users"."id" DESC LIMIT ?
  #   #users.project(users[:age].count)
  #   # => SELECT COUNT(users.age) FROM users
  #
  # end
end
