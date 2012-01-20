class ReservationBuilder
  extend ActiveModel::Naming
  include ActiveModel::AttributeMethods
  include ActiveModel::Conversion
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::Validations

  attribute_method_suffix "", "="
  define_attribute_methods %w[user reservation book]

  #attr_accessible :reservation
  attr_reader :attributes

  validate :user_presence

  def initialize(attrs = {}, auth = nil, current_user = nil)

    @attributes = {}

    case auth
    when :login
      @user = User.find_for_authentication(:email => attrs[:user][:email])

      if @user.nil?
        @authenticated = false
        @user = User.new(:email => attrs[:user][:email])
        @user.errors.add(:email, @user.errors.generate_message(:email, :invalid))
      else
        @authenticated = @user.valid_password?(attrs[:user][:password])
        @user.errors.add(:password, @user.errors.generate_message(:password, :invalid)) unless @uthenticated
      end
    when :register
      @user = User.new(attrs[:user])
      @authenticated = @user.save
    else
      @authenticated = current_user.present?
      @user = current_user
    end

    @reservation = Reservation.new(attrs[:reservation])
    @reservation.user = @user if @authenticated

    @attributes[:user] = @user
    @attributes[:reservation] = @reservation
  end

  def attributes=(attributes)
    sanitize_for_mass_assignment(attributes).each { |key, value| send("#{key}=", value) }
  end

  def save
    valid? && @reservation.save
  end


  private

  def attribute(attribute)
    @attributes[attribute.to_sym]
  end

  def attribute=(attribute, value)
    @attributes[attribute.to_sym] = value
  end

  def user_presence
    unless @user
      errors.add(:user, errors.generate_message(:user, :empty))
    else
      unless @authenticated
        errors.add(:user, errors.generate_message(:user, :invalid))
      end
    end
  end

end
