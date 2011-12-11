module BooksHelper

  def available_copies(book)
    copies(book)
  end

  def unavailable_copies(book)
    copies(book, false)
  end

  def copies_count(book)
    "#{book.copies.available.count} / #{book.copies.count}"
  end

  private

  def copies(book, available = true)
    html_class = available ? 'available label rent' : 'unavailable label return'

    book.copies.where(:available => available).map do |c|
      options = { :id => c.id }
      path = available ? copy_path(options) : copy_path(options)
      link_to c.index, path, :class => html_class, :rel => :facebox
    end.join.html_safe
  end
end
