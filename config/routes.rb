Rails.application.routes.draw do

  root to: "users#index"

  get "/users", to: "users#index", as: "users"

  get "/users/new", to: "users#index", as: "new_user"

end
