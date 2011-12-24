class OrdersController < ApplicationController

  respond_to :html, :js

  def create
    auth = :register if params[:register]
    auth = :login if params[:login]

    @orders_builder = OrdersBuilder.new(params[:orders_builder], auth)
    @order = @orders_builder.order

    unless @orders_builder.save
      flash_message(:error, t("flash.actions.create.error"))
    else
      sign_in(@orders_builder.user)
    end

    respond_with @order, :layout => !request.xhr?
  end

  private
end
