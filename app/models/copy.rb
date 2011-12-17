class Copy < ActiveRecord::Base
  belongs_to :book
  has_many :orders

  delegate :title, :author, :details, :category, :to => :book

  scope :available, where(:available => true)
  scope :rented, where(:available => false)
end
