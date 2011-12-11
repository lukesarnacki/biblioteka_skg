class ExtractYearFromEditionField < ActiveRecord::Migration
  def self.up
    add_column :books, :year, :integer, :default => nil, :allow_nil => true
    Book.all.each do |book|
      book.year = book.edition.scan(/\d\d\d\d/).first
      puts "#{book.save} - #{book.year.to_s.ljust(4, "n")} - #{book.title}"
    end
  end

  def self.down
    remove_column :books, :year
  end
end
