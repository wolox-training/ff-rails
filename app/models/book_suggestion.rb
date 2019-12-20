class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates :author, :title, :editor, :year, presence: true
end
