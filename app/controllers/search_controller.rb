class SearchController < ApplicationController
  include SearchHelper
  before_action :set_user, only: [:create]

    def index
      @search = Search.all
    end

    def new
    end

    def create
      Search.delete_all
      book_name = params[:search][:title]
      @search = Search.new(search_params)
      @search.data = display_results(book_name)
      @search.save

      redirect_to search_path
    end

    private

      def search_params
        params.require(:search).permit(:data)
      end


end
