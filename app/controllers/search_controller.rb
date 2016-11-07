class SearchController < ApplicationController
  include SearchHelper
  before_action :set_user, only: [:create]

    def index
    end

    def new
    end

    def create
      book_name = params[:search][:title]
      puts "!!!!!!!!!!!" + book_name
      redirect_to search_path
    end

end
