class User < ApplicationRecord
  has_many :recipes

  has_secure_password

  require 'securerandom'

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_presence_of :name, :email, if: :regular_login
  validates_uniqueness_of :email, if: :regular_login
  validates :password, :length => {:within => 6..40}
  scope :most_recipes, -> { joins(:recipes).where ('x') }

  def regular_login
    !self.uid
  end

  def self.google_login(auth)
    find_or_create_by(email: auth['info']['email']) do |u|
       u.name = auth['info']['name']
       u.email = auth['info']['email']
       u.password = SecureRandom.hex(10)
       # Generate secure random
    end
  end

  def most_recipes
    User.order("users.recipes_count DESC").limit(1)
  end

  def auth
    request.env["omniauth.auth"]
  end

end
