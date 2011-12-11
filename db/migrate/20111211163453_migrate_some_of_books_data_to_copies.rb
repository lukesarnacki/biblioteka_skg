class MigrateSomeOfBooksDataToCopies < ActiveRecord::Migration
  def up
    to_be_destroyed = []

    Book.all.each do |book|
      unless to_be_destroyed.include?(book.id)
        similar_books = Book.where(:title => book.title, :author => book.author, :details => book.details)
        p "Creating book copy: #{book.title}, #{book.author}, #{book.details}"
        similar_books.each do |copy|
          copy.index.split(',').each do |index|
            p "-- #{index}, #{copy.publication.blank? ? 'brak wydania' : copy.publication}"
            Copy.create(:book_id => book.id, :index => index.chomp, :publication => copy.publication)
          end
        end

        to_be_destroyed += similar_books.where(["id <> ?", book.id]).map(&:id)

      end
    end

    Book.where(:id => to_be_destroyed).destroy_all
  end

  def down
    # won't be needed
  end
end
