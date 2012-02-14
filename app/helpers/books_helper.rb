module BooksHelper

  def book_class(book)
    'reserved' if book.reserved?
  end
end
