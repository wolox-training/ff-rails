class AddReturnedAtToRent < ActiveRecord::Migration[5.1]
  def change
    add_column :rents, :returned_at, :date
  end
end
