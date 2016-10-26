require "net/http"
require "json"

require "openssl"
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class Book < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  
  def set_user(user)
    self.user_id = user.id 
    self.save    
  end

  def self.book_url(book_name)
    "https://www.googleapis.com/books/v1/volumes?q=#{book_name}&key=AIzaSyClVh3afJBvhtM1MDKsrDDlCpO3GnhHrOE"
  end

  def self.fetch_book_data(book_name)
    uri = URI(book_url(book_name))
    response = Net::HTTP.get(uri)
    JSON.parse(response)    
  end

    def self.find_book(user, book_name, genre)
    book_data = fetch_book_data(book_name)
    the_book = book_data["items"][0]["volumeInfo"]
    b = Book.new
    b.user_id = user.id
    b.title = the_book["title"]
    b.genre = genre
    b.author = the_book["authors"][0]
    b.publisher =  the_book["publisher"]
    b.publication_date =  the_book["publishedDate"]
    b.synopsis =  the_book["description"]
    b.image = the_book["imageLinks"]["thumbnail"]
    b.save
    # return the new book at the end of the method
    b
  end   


  # def self.find_book(tempBook, tempGenre, tempId)
  #   url = "https://www.googleapis.com/books/v1/volumes?q=" + tempBook + "&key=AIzaSyClVh3afJBvhtM1MDKsrDDlCpO3GnhHrOE"
  #   uri = URI(url)
  #   response = Net::HTTP.get(uri)
  #   book_data = JSON.parse(response)
  #   book_data = book_data["items"][0]["volumeInfo"]
  #   b = Book.new
  #   b.user_id = tempId
  #   b.title = book_data["title"]
  #   b.genre = tempGenre
  #   b.author = book_data["authors"][0]
  #   b.publisher =  book_data["publisher"]
  #   b.publication_date =  book_data["publishedDate"]
  #   b.synopsis =  book_data["description"]
  #   b.image = book_data["imageLinks"]["thumbnail"]
  #   @book = b.save
  # end

end

