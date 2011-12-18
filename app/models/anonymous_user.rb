class AnonymousUser < AbstractUser
  attr_accessible :name
  validates_presence_of :name
end
