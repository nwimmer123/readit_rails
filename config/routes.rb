Rails.application.routes.draw do

  root to: "books#index"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy", as: "delete_user"

  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy"
  post "/login", to: "sessions#create"

  get "/books", to: "books#index", as: "books"
  get "/books/new", to: "books#new", as: "new_book"
  post "/books", to: "books#create"
  get "/books/:id", to: "books#show", as: "book"
  get "/books/:id/edit", to: "books#edit", as: "book_edit"
  patch "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy", as: "delete_book"

  get "/books/:book_id/reviews", to: "reviews#index", as: "reviews"
  get "/books/:book_id/reviews/new/(:parent_id)", to: "reviews#new", as: "new_review"
  post "/books/:book_id/reviews/", to: "reviews#create"
  get "/books/:book_id/reviews/:id/edit", to: "reviews#edit", as: "edit_book_review"
  patch "/books/:book_id/reviews/:id", to: "reviews#update"
  delete "/books/:book_id/reviews/:id", to: "reviews#destroy", as: "delete_book_review"

end
