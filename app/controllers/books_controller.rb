class BooksController < ApplicationController

  def index
    @books = Book.all
    render :index
  end

  def new
    @book = Book.new
    render :new
  end

  def create
    @Book = Book.create(user_params)
    redirect_to root_path
  end

  def show
    @book = Book.find_by_id(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:book).permit(:title, :author, :genre, :image, :publication_date, :publisher, :synopsis)
  end

end
