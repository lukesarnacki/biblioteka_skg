class AbstractUser < ActiveRecord::Base
  set_table_name "library_users"
  has_many :orders, :foreign_key => :user_id
  validates :email, :uniqueness => true, :presence => true
  validates :name, :presence => true
  attr_accessible :name, :email, :phone
end
