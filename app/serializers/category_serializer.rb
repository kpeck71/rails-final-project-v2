class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :category_recipes
  has_many :recipes, through: :category_recipes
end
