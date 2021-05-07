class BooksController < ApplicationController
  include ErrorLibrary
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    user = User.find(params[:user_id])
    render json: {:user => user.name, :books => user.books}
  rescue ActiveRecord::RecordNotFound
    render json: user_not_found, :status => 404
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  # GET /books/all
  def all
    records_per_page = 10
    total = Book.all.count
    pages = (Float(total)/records_per_page).ceil
    
    if params[:page]
      page = params[:page].to_i
      if page >= 1 && page <= pages
        current_page = page
      else
        current_page = 1
      end
    else
      current_page = 1
    end

    books = Book.limit(records_per_page).offset((current_page - 1) * records_per_page)

    render json: {:current_page => current_page, :pages => pages, :total => total, :hobbies => books}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: book_not_found, :status => 404
    rescue
      render json: internal_server_error, :status => 500
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:user_id, :title, :author, :language, :pages, :year)
    end
end
