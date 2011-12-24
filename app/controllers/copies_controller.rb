class CopiesController < ApplicationController

  respond_to :html, :js
  before_filter :load_objects, :only => :show

  def show
    respond_with @copy, :layout => !request.xhr?
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

  def load_objects
    @copy = Copy.find(params[:id])
    @order = @copy.available? ? @copy.orders.build : @copy.last_order
    @anonymous_user = @order.build_anonymous_user
  end
end
