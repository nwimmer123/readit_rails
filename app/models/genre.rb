class Genre < ActiveRecord::Base
  has_many :books

  genres = ["Sci-Fi","Fantasy","Comics","Graphic Novel","Manga","Drama","Nonfiction","Mystery","Horror","Anthology","Biographies","Autobiographies"]
end
