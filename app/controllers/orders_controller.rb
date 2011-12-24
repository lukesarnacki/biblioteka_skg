class OrdersController < ApplicationController

  respond_to :html, :js

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
