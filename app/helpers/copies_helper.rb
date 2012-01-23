module CopiesHelper
  def reservation_user_label(user)
    text = "#{user.name}, #{user.email}"
    text += ", #{user.phone}" unless user.phone.blank?
    label_tag "order_user_id_#{user.id}", text
  end
end
