class AbstractUser < ActiveRecord::Base
  set_table_name "library_users"
  has_many :orders, :foreign_key => :user_id
  validates :name, :presence => true
  attr_accessible :name, :email, :phone

  def self.search(q)
    v = "%#{q.downcase}%"
    where([" LOWER(name) LIKE ? OR phone LIKE ? OR LOWER(email) LIKE ?", v, v, v])
  end

  def as_json(options = {})
    {:email => email, :phone => phone, :name => name, :id => id}
  end
end
