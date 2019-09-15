class User < ApplicationRecord
  validates :email, uniqueness: { case_sensitive: false }, presence: true

  has_secure_password

  before_save { self.email = self.email.to_s.downcase }
  after_create :api_key

  def api_key
    self.update(api_key: SecureRandom.hex)
  end
end
