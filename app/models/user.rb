class User < ApplicationRecord
  validates :email, presence: true,  uniqueness: true
  validates :username, presence: true,  uniqueness: true
  has_secure_password

  has_many :categories
  has_many :tasks, through: :categories
end
