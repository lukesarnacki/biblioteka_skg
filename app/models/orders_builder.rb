class OrdersBuilder
  extend ActiveModel::Naming
  include ActiveModel::AttributeMethods
  include ActiveModel::Conversion
  include ActiveModel::MassAssignmentSecurity
  include ActiveModel::Validations

  attribute_method_suffix "", "="
  define_attribute_methods %w[user order book]

  #attr_accessible :order
  attr_reader :attributes

  def initialize(attrs, auth = nil, current_user = nil)

    @attributes = {}

    case auth
    when :login
      @user = User.find_for_authentication(:email => attrs[:user][:email])
      authenticated = @user.valid_password?(attrs[:user][:password])
    when :register
      @user = User.new(attrs[:user])
      authenticated = @user.save
    else
      @user = current_user
      aurhenticated = true
    end

    @order = Order.new(attrs[:order])
    @order.user = @user if authenticated

    @attributes[:user] = @user
    @attributes[:order] = @order
  end

  def attributes=(attributes)
    sanitize_for_mass_assignment(attributes).each { |key, value| send("#{key}=", value) }
  end

  def save
    valid? && @order.save
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
      unless @user.valid?
        errors.add(:user, errors.generate_message(:user, :invalid))
      end
    end
  end

end
