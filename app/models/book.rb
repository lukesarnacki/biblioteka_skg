class Book < ActiveRecord::Base
  belongs_to :category
  has_many :copies


  def available_copies_count
    self.copies.available.count
  end

  def copies_count
    self.copies.count
  end
end
