Rails.application.routes.draw do

  root "welcome#home"

  # Users
  resources :users, only: [:new, :create, :show]
  get "/logout" => "users#destroy"

  # Sessions
  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"

  # Attractions
  resources :attractions

  # Rides
  resources :rides, only: [:create]

end
