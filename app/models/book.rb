class Book < ActiveRecord::Base
  belongs_to :category
  has_many :copies
  validates_length_of :copies, :minimum => 1
  validates :title, :category_id, :presence => true
  accepts_nested_attributes_for :copies


  def available_copies_count
    self.copies.available.count
  end

  def copies_count
    self.copies.count
  end
end
