class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.create(book_params)
    @book.set_user!(current_user)
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
