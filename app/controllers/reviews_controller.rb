class ReviewsController < ApplicationController

	before_action :set_user, only: [:index, :create]
	before_action :set_book, only: [:new, :create, :edit, :update]
	before_action :current_review, only: [:edit, :update, :destroy]

	def index
		@reviews = Review.hash_tree
	end

	def new
		@review = Review.new(parent_id: params[:parent_id]) 
	end

	def create	
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

	def edit
	end

	def update
		@review.update_attributes(review_params)
		redirect_to book_path(@book)
	end

	def destroy
		@review.destroy
	end

	private

		def review_params
			params.require(:review).permit(:body, :spoiler, :book_id, :user_id)
		end

		def set_book
			@book = Book.find_by_id(params[:book_id])
		end

		def current_review
			@review = Review.find_by_id(params[:id])
		end
end
