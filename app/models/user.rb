class User < ApplicationRecord
  before_create :generate_api_key
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates_uniqueness_of :api_key
  has_secure_password
  before_save { self.email = self.email.to_s.downcase }


  def generate_api_key
    self.api_key = SecureRandom.hex
  end
end
