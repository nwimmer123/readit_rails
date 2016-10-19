module BooksHelper

  def review_displayer
    puts "LOOK HERE"
    puts @book.review.spoiler
    # if @book.review.spoiler = "1"
    #   display_spoiler
    # elsif @book.review.spoiler = "0"
    #   dont_display_spoilers
    # else
    #   display_all
    #end
  end

end
