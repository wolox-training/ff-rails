class AddBookTitleSizeLimit < ActiveRecord::Migration[5.1]
  def up
    truncate_book_titles
    change_column :books, :title, :string, :limit => 25
  end

  def down
    change_column :books, :title, :string, :limit => nil
  end
  
  def truncate_book_titles
    Book.all.each do |book|
      book.title = book.title.truncate(25)
      book.save!
    end
  end
end
