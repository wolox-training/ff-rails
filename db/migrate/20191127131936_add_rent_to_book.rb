class AddRentToBook < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :rent, foreign_key: true
  end
end
