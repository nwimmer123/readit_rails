class BooksController < ApplicationController

  before_action :current_book, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :show, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    book_name = params[:book][:title]
    genre = params[:book][:genre]
    user = @user.id
    find_book
    redirect_to root_path
  end

  def show
    @reviews = Review.hash_tree
  end

  def edit
  end

  def update
    @book.update_attributes(book_params)
    redirect_to user_path
  end

  def destroy
    @book.destroy
    redirect_to user_path(@user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :image, :publication_date, :publisher, :synopsis)
  end

  def current_book
    @book = Book.find_by_id(params[:id])
  end

  def find_book
    @book = Book.find_book(current_user, params[:book][:title], params[:book][:genre])
  end

  def set_user
    @user = current_user
  end

end
