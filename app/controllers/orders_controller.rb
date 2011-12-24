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

  def check_out
    @order = Order.create(params[:order])
    @copy = @order.copy

    unless @order.save
      flash_message(:error, t("flash.actions.create.error"))
    end

    respond_with @order, :location => request.xhr? ? @order : books_path, :layout => !request.xhr?
  end

  def check_in
    @order = Order.find(params[:id])
    @copy = @order.copy
    @order.check_in(params[:order])

    unless @order.valid?
      flash_message(:error, t("flash.actions.create.error"))
    end

    respond_with @order, :location => request.xhr? ? @order : books_path, :layout => !request.xhr?
  end

  private
end
