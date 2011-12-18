class Copy < ActiveRecord::Base
  belongs_to :book
  has_many :orders

  delegate :title, :author, :details, :category, :to => :book

  state_machine :state, :initial => :available do
    event :check_out do
      transition :available => :borrowed
    end

    event :check_in do
      transition :borrowed => :available
    end

    state :available, :value => 1
    state :borrowed, :value => 0
  end

  scope :available, where(:state => 1)
  scope :borrowed, where(:state => 0)

  def last_order
    self.orders.order('created_at DESC').first
  end
end
