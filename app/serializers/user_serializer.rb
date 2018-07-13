class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :recipes_count

  has_many :recipes
end
