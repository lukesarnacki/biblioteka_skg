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

  private

  def copies(book, available = true)
    html_class = available ? 'available label check-out' : 'unavailable label check-in'

    scope = book.copies
    scope = available ? scope.available : scope.borrowed

    scope.map do |c|
      options = { :id => c.id }
      path = copy_path(options)
      link_to c.index, path, :class => html_class, :rel => :facebox
    end.join.html_safe
  end
end
