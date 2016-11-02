class ReviewsController < ApplicationController

	before_action :set_user, only: [:index, :create]

  def index
    @reviews = Review.hash_tree
  end

  def new
    @book = Book.find(params[:id])
    @review = Review.new(parent_id: params[:parent_id]) 
  end

  def create	
    @book = Book.find(params[:id])
		if params[:review][:parent_id].to_i > 0
	    parent = Review.find_by_id(params[:review].delete(:parent_id))
	    @review = parent.children.build(review_params)
			@review.user = current_user
	  else
	    @review = Review.new(review_params)
			@review.user = current_user
	  end

    if @review.save
	    flash[:success] = 'Your comment was successfully added!'
	  else
	    render 'new'
	  end

		redirect_to book_path(@book)
  end

  private

		def review_params
			params.require(:review).permit(:body, :spoiler, :book_id, :user_id)
		end

end
