class ApplicationController < ActionController::Base
  protect_from_forgery


  def flash_message(type, message)
    if request.xhr?
      flash.now[type] = message
    else
      flash[type] = message
    end
  end
end
