class User < ApplicationRecord
  has_many :recipes

  has_secure_password

  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates_presence_of :name, :email, if: :regular_login
  validates_uniqueness_of :email, if: :regular_login
  validates :password, :length => {:within => 6..40}

  def regular_login
    !self.uid
  end
end
