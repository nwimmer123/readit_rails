class BooksController < ApplicationController

  before_action :current_book, only: [:show, :edit, :update, :destroy, :show_reviews, :show_spoilers, :show_all]

  before_action :get_reviews, only: [:show_reviews, :show_spoilers, :show_all]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @user = current_user
    @book = Book.create(book_params)
    @book.set_user(current_user)
    redirect_to root_path
  end

  def show
    #@book = current_book 
    @user = current_user
    @reviews = Review.all
    find_reviews
    #@reviews = Review.find_by_book_id(current_book.id)
    
  end

  def edit
  end

  def update
    @user = current_user
    @book.update_attributes(book_params)
    redirect_to user_path
  end

  def destroy
    @user = current_user
    @book.destroy
    redirect_to user_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :genre, :image, :publication_date, :publisher, :synopsis)
  end

  def current_book
    @book = Book.find_by_id(params[:id])
  end

  def find_reviews
    puts "LOOK HERE!!!!!!"
    @reviews.each do |review|
      if review.book_id.to_s == params[:id].to_s
        puts review.spoiler
      end
    end
    @show_the_reviews = true
  end

  def get_reviews
    @show_the_reviews
    @reviews = Review.all
  end

end
