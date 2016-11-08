require "net/http"
require "json"
require "openssl"
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Book < ActiveRecord::Base

  belongs_to :user
  has_many :reviews, dependent: :destroy

  SECRET_KEY = Figaro.env.google_books

  def self.book_url(book_name)
    "https://www.googleapis.com/books/v1/volumes?q=#{book_name}&key=#{SECRET_KEY}"
  end

  def self.fetch_book_data(book_name)
    uri = URI(book_url(book_name))
    response = Net::HTTP.get(uri)
    JSON.parse(response)    
  end

  def self.display_results(book_name)
    @book_data = fetch_book_data(book_name)
  end 

  def self.find_book(user, book_name, genre)
    book_data = fetch_book_data(book_name)
    the_book = book_data["items"][0]["volumeInfo"]
    authors = []
    b = Book.new
    b.user_id = user.id
    b.title = the_book["title"]
    b.genre = genre
    authors = the_book["authors"]
    if authors.nil?
      authors = ["No Author Listed"]
    end
    b.author = authors.join(", ")
    b.publisher =  the_book["publisher"]
    b.publication_date =  the_book["publishedDate"]
    b.synopsis =  the_book["description"]
    b.image = the_book["imageLinks"]["thumbnail"]
    b.save
    b
  end   

end

