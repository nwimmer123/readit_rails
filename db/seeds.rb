# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.destroy_all

rd =  Book.create(user_id:1,
      title:"Reality Dysfunction",
      author:"Peter Hamilton",
      genre:"Sci-fi",
      image:"http://sfreviews.net/large_covers/reality_dysfunction.jpg",
      publicationDate:"1996")
fr =  Book.create(user_id:1,
      title:"The Fellowship of the Ring",
      author:"J.R.R. Tolkien",
      genre:"Fantasy",
      image:"http://www.pagepulp.com/wp-content/527.jpg",
      publicationDate: "1954")
hy =  Book.create(user_id:1,
      title:"Hyperion",
      author:"Dan Simmons",
      genre:"Sci-fi",
      image:"http://ecx.images-amazon.com/images/I/51zwyTJNlWL.jpg",
      publicationDate:"1989")


