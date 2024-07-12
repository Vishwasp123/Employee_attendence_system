class User < ApplicationRecord

  has_secure_password
  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :password_digest, presence: true
  # validates :gender, inclusion: { in: ['male', 'female', 'other'] }
  # # validates :password, length: { minimum: 6 }, allow_nil: true
  # validates :active, inclusion: { in: [true, false] }
end
