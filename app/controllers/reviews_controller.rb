class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
  end

  def create
    @book = Book.find(params[:id])
		@review = @user.reviews.create(review_params)
		redirect_to book_path(@book)
  end

  	private
		def review_params
			params.require(:review).permit(:reviewer, :body, :rskill)
		end

end
