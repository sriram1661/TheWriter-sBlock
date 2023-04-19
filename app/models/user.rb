class User < ApplicationRecord
  include ActiveModel::SecurePasswordw
  has_many :article
  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  EMAIL_VALIDATOR = "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$"
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  has_secure_password
end
