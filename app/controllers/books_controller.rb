    class BooksController < ApplicationController

      before_action :current_book, only: [:show, :edit, :update, :destroy]

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
        @user = current_user
        #@reviews = Review.hash_tree
        @reviews = Review.all

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

    end
