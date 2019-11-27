class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :genre, :editor, :year
  has_one :rent
end
