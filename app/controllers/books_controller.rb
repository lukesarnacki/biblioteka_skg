class BooksController < ApplicationController

  @@per_page = 20
  load_and_authorize_resource
  before_filter :get_objects
  respond_to :html

  def index
    @books = @books.where("LOWER(title) LIKE ?", "%#{params[:query]}%") unless params[:query].blank?
    @books = @books.where(:category_id => params[:category_id]) unless params[:category_id].blank?

    @books = @books.select('distinct library_books.*').joins('INNER JOIN library_copies on library_copies.book_id = library_books.id LEFT JOIN library_reservations ON library_reservations.book_id = library_books.id').order('library_reservations.book_id DESC, library_copies.state ASC') if signed_in? && current_user.admin?

    @books = @books.order('title ASC').paginate :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @books }
    end
  end

  # GET /books/1
  # GET /books/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @copies = [@book.copies.build]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @copies = @book.copies
  end

  # POST /books
  # POST /books.xml
  def create
    respond_to do |format|
      if @book.save
        format.html { redirect_to(books_path(:anchor => "book_#{@book.id}"), :success => 'Book was successfully created.') }
        format.xml  { render :xml => @book, :status => :created, :location => @book }
      else
        raise @book.copies.inspect
        format.html { render :action => "new" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to(books_path(:anchor => "book_#{@book.id}"), :success => 'Book was successfully updated.') }
        format.xml  { head :ok }
      else
        flash[:error] = t('flash.actions.create.error')
        format.html { render :action => "edit" }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to(books_url) }
      format.xml  { head :ok }
    end
  end

  def reserve
    @reservation_builder = ReservationBuilder.new
    @reservation = @book.reservations.build
    @user = user_signed_in? ? current_user : User.new

    respond_with @book, :layout => !request.xhr?
  end

  def add_new_copy
    raise params[:form].inspect
    @form = params[:form]
    @copies = @book.copies
    @copies << Copy.new
  end

  private

  def get_objects
    @categories = Category.order('name ASC')
  end
end
