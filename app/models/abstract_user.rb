class AbstractUser < ActiveRecord::Base
  set_table_name "library_users"
  has_many :orders, :foreign_key => :user_id
  validates :email, :uniqueness => true
end
