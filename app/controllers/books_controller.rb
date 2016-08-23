class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @Book = Book.create(book_params)
    redirect_to root_path
  end

  def show
    @book = Book.find_by_id(params[:id])
    render :show
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :image, :publication_date, :publisher, :synopsis)
  end

end
