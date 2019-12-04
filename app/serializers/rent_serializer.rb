class RentSerializer < ActiveModel::Serializer
  attributes :id, :book_id, :user_id, :start_date, :end_date
end
