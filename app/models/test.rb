require "net/http"
require "json"

require "openssl"
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

books = ["pandoras star", "otherland", "hyperion"]

  def find_book(book)
    url = "https://www.googleapis.com/books/v1/volumes?q=" + book + "&key=AIzaSyClVh3afJBvhtM1MDKsrDDlCpO3GnhHrOE"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)
    author = json_response["items"][0]["volumeInfo"]["authors"]
    publisher =  json_response["items"][0]["volumeInfo"]["publisher"]
    p_date =  json_response["items"][0]["volumeInfo"]["publishedDate"]
    synopsis =  json_response["items"][0]["volumeInfo"]["description"]
    image_url = json_response["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]

    puts author
    puts publisher
    puts p_date
    puts synopsis
    puts image_url
  end

  books.each { |book|
  find_book(book)
  }

find_book([books])

