class RentSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :returned_at
  has_one :book, serializer: BookSerializer
  has_one :user, serializer: UserSerializer
end
