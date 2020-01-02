class ChangeUserIdNullableBookSuggestion < ActiveRecord::Migration[5.1]
  def change
    change_column :book_suggestions, :user_id, :bigint, null: true
  end
end
