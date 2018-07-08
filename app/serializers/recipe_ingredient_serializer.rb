class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :recipe_id, :ingredient_id
  belongs_to :recipe
  belongs_to :ingredient
end
