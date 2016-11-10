class BooksController < ApplicationController

  before_action :current_book, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:create, :show, :update, :destroy]

  def index
    @books = Book.all
    @books = @books.order(created_at: :desc)
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    @book.save
    redirect_to root_path
  end

  def show
    @reviews = Review.hash_tree
  end

  def edit
  end

  def update
    @book.update_attributes(book_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @reviews = Review.where(book_id: @book.id)
    @reviews.each do |review|
      review.destroy
    end
    @book.destroy
    redirect_to user_path(@user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :image, :publication_date, :publisher, :synopsis, :current)
  end

  def current_book
    @book = Book.find_by_id(params[:id])
  end

end
