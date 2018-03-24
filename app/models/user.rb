class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  validates_uniqueness_of :email

end
