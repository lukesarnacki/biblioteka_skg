class AnonymousUser < AbstractUser
  validates :email, :uniqueness => true, :presence => true
end
