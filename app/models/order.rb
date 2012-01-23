class Order < ActiveRecord::Base
  belongs_to :copy
  belongs_to :user, :class_name => "AbstractUser"
  belongs_to :anonymous_user, :foreign_key => :user_id
  accepts_nested_attributes_for :anonymous_user

  after_initialize :set_from
  after_create :auto_check_out
  before_destroy :auto_check_in

  validates_presence_of :to, :on => :update
  validates :from, :user_id, :presence => true

  after_create :destroy_reservation

  def set_from
    self.from = Date.today
  end

  def copy_availability
  end

  def check_in(params)
    if self.update_attributes(:to => params[:to])
      checked_in = copy.check_in
    end
    checked_in
  end

  private
  def auto_check_out
    self.copy.check_out
  end

  def auto_check_in
    copy.check_in if copy.last_order == self
  end

  def destroy_reservation
    self.copy.reservations.where(:user_id => self.user).destroy_all
  end
end
