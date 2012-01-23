class CopiesController < ApplicationController

  respond_to :html, :js

  def show
    @copy = Copy.find(params[:id])
    @order = @copy.available? ? @copy.orders.build : @copy.last_order
    @anonymous_user = @order.build_anonymous_user
    load_objects
    respond_with @copy, :layout => !request.xhr?
  end

  def check_out
    @order = Order.create(params[:order])
    @copy = @order.copy
    load_objects

    unless @order.save
      @anonymous_user_choosed = params[:order][:user_id] == 'anonymous_user'
      flash_message(:error, t("flash.actions.create.error"))
    end

    respond_with @order, :location => request.xhr? ? check_out_copies_path : books_path, :layout => !request.xhr?
  end

  def check_in
    @order = Order.find(params[:id])
    @copy = @order.copy
    @order.check_in(params[:order])

    unless @order.valid?
      flash_message(:error, t("flash.actions.create.error"))
    end

    respond_with @order, :location => request.xhr? ? check_in_copy_path(@copy) : books_path, :layout => !request.xhr?
  end

  private

  def load_objects
    @book = @copy.book
    @reservations = @copy.reservations
    @show_user_fields = @reservations.empty?
  end
end
