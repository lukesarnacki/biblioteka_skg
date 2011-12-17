class Order < ActiveRecord::Base
  belongs_to :copy
  after_initialize :set_from

  validates :borrowers_name, :from, :presence => true

  def set_from
    self.from = Date.today
  end
end
