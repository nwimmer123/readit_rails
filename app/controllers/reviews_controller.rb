class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @book = Book.find(params[:id])
    @review = Review.new(parent_id: params[:parent_id]) 

    redirect_to book_path(@book)
  end

  def create
    @book = Book.find(params[:id])
		@review = Review.create(review_params)

		redirect_to book_path(@book)
  end

  	private
		def review_params
			params.require(:review).permit(:body, :spoiler, :book_id, :user_id)
		end

end
