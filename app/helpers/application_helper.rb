module ApplicationHelper
  def available_copies(book)
    copies(book)
  end

  def unavailable_copies(book)
    copies(book, false)
  end

  def copies_count(book)
    "#{book.available_copies_count} / #{book.copies_count}"
  end

  def reservations_count(book)
    book.reservations.count
  end

  def reserved_html_class(book)
    book.reserved?.to_s
  end

  private

  def copies(book, available = true)
    html_class = available ? 'available btn success small check-out' : 'unavailable btn danger small check-in'

    scope = book.copies
    scope = available ? scope.available : scope.borrowed

    scope.map do |c|
      options = { :id => c.id }
      path = copy_path(options)
      link_to c.index, path, :class => html_class, :rel => :facebox
    end.join.html_safe
  end

  def book_class(book)
    'reserved' if book.reserved?
  end
end
