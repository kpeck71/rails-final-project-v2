class User < ApplicationRecord
  has_many :recipes

  has_secure_password

  validates_presence_of :name, :email, if: :regular_login
  validates_uniqueness_of :email, if: :regular_login
  validates_uniqueness_of :name

  def regular_login
    !self.uid
  end

  def self.from_omniauth(auth)
    raise auth.inspect
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.password = SecureRandom.urlsafe_base64(n=6) # generate random password to override blank password error
      user.save!
    end
  end
end
