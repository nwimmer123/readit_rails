class GoogleBook

  def intialize(info)
  end

  def find_book
    url = "https://www.googleapis.com/books/v1/volumes?q=" + tempBook + "&key=AIzaSyClVh3afJBvhtM1MDKsrDDlCpO3GnhHrOE"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    book_data = JSON.parse(response)
    book_data = book_data["items"][0]["volumeInfo"]
    b = Book.new
    b.user_id = @user.id
    b.title = book_data["title"]
    b.genre = tempGenre
    b.author = book_data["authors"][0]
    b.publisher =  book_data["publisher"]
    b.publication_date =  book_data["publishedDate"]
    b.synopsis =  book_data["description"]
    b.image = book_data["imageLinks"]["thumbnail"]
    @book = b.save
  end

end