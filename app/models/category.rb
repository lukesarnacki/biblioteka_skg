class Category < ActiveRecord::Base
  has_many :books

  def to_s
    self.name
  end
end
