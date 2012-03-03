class CopiesController < ApplicationController

  respond_to :html, :js
  load_and_authorize_resource
  before_filter :load_book, :only => [:new, :edit, :create, :update]


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

  def new
    respond_with @copy, :layout => !request.xhr?
  end

  def create
    unless @copy.save
      flash_message(:error, t("flash.actions.create.error"))
    end

    respond_with @copy, :location => edit_book_path(@book), :layout => !request.xhr?
  end

  def edit
    respond_with @copy, :layout => !request.xhr?
  end

  def update
    unless @copy.update_attributes(params[:copy])
      flash_message(:error, t("flash.actions.create.error"))
    end

    respond_with @copy, :location => edit_book_path(@book), :layout => !request.xhr?
  end

  def destroy
    @copy = Copy.find(params[:id])
    @book = @copy.book
    @copy.destroy

    respond_to do |format|
      format.html { redirect_to(edit_book_path(@book)) }
      format.xml  { head :ok }
    end
  end

  private

  def load_book
    @book = Book.find(params[:book_id])
  end

  def load_objects
    @book = @copy.book
    @reservations = @copy.reservations
    @show_user_fields = @reservations.empty?
  end
end
