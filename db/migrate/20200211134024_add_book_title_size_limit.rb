class AddBookTitleSizeLimit < ActiveRecord::Migration[5.1]
  def change
    truncate_book_titles
    change_column :books, :title, :text, :limit => 25
  end
  
  def truncate_book_titles
    Book.all.each do |b|
      b.title = b.title.truncate(25)
      b.save!
    end
  end
end
