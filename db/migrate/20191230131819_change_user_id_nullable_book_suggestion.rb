class ChangeUserIdNullableBookSuggestion < ActiveRecord::Migration[5.1]
  def change
    change_column :book_suggestions, :user_id, null: true
  end
end
