class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  validates :first_name, :last_name, presence: true
end