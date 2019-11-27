class Book < ApplicationRecord
  has_one :rent, dependent: :destroy
  validates :genre, :author, :image, :title, :editor, :year, presence: true
end
