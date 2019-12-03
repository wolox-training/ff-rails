class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :editor, :year
  has_many :rents
end
