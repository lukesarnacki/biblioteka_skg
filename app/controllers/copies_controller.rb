class CopiesController < ApplicationController

  respond_to :html, :js
  before_filter :load_objects

  def show
    respond_with @copy, :layout => !request.xhr?
  end

  def return

  end

  def lend
    respond_with @copy, :layout => !request.xhr?
  end

  private

  def load_objects
    @copy = Copy.find(params[:id])
    @order = @copy.orders.build
  end
end
