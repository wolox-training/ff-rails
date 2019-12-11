class RentSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :book_id, :user_id
end
