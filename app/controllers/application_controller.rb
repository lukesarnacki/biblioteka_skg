class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.message
  end

  def flash_message(type, message)
    if request.xhr?
      flash.now[type] = message
    else
      flash[type] = message
    end
  end
end
