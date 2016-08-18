Rails.application.routes.draw do

  root to: "books#index"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"

  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"

  get "/books", to: "books#index", as: "books"
  get "/books/new", to: "books#new", as: "new_book"
  post "/books", to: "books#create"
  get "books/:id", to: "books#show", as: "book"


end
