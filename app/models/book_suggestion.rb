class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true
  validates :author, :title, :editor, :year, :link, presence: true
end
