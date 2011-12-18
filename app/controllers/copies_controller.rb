class CopiesController < ApplicationController

  respond_to :html, :js
  before_filter :load_objects

  def show
    respond_with @copy, :layout => !request.xhr?
  end

  def return
  end

  def lend
  end

  private

  def load_objects
    @copy = Copy.find(params[:id])
    @order = @copy.available? ? @copy.orders.build : @copy.last_order
    @anonymous_user = @order.build_anonymous_user
  end
end
