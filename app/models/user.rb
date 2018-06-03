class User < ApplicationRecord
  has_many :recipes

  has_secure_password

  require 'securerandom'

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates :password, presence: true, :length => {minimum: 6}

  # def regular_login
  #   !self.uid
  # end

  def self.google_login(auth)
    find_or_create_by(email: auth['info']['email']) do |u|
       u.name = auth['info']['name']
       u.email = auth['info']['email']
       u.uid = auth['uid']
       u.provider = auth['provider']
       u.password = SecureRandom.hex(20)
       u.password_confirmation = u.password
       u.save
    end
  end

  def self.most_recipes
    User.order("users.recipes_count DESC")
  end

  def auth
    request.env["omniauth.auth"]
  end

end
