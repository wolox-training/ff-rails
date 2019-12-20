class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :rents, dependent: :destroy
  has_many :book_suggestion, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
