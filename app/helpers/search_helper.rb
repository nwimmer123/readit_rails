module SearchHelper

  require "net/http"
  require "json"
  require "openssl"
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  SECRET_KEY = Figaro.env.google_books

  def book_url(book_name)
    "https://www.googleapis.com/books/v1/volumes?q=#{book_name}&key=#{SECRET_KEY}"
  end

  def fetch_book_data(book_name)
    uri = URI(book_url(book_name))
    response = Net::HTTP.get(uri)  
  end

  def display_results(book_name)
    @book_data = fetch_book_data(book_name)
  end 

end
