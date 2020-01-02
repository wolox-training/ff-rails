class AddLinkToBookSuggestion < ActiveRecord::Migration[5.1]
  def change
    add_column :book_suggestions, :link, :string, null: false
  end
end
