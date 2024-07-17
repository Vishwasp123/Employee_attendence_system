class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_secure_password
  has_many :attendances

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true
  # validates :password_digest, presence: true
  # validates :gender, inclusion: { in: ['male', 'female', 'other'] }
  # # validates :password, length: { minimum: 6 }, allow_nil: true
  # validates :active, inclusion: { in: [true, false] }
end
