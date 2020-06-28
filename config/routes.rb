Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :attractions
  get "/signin" => "session#new"
  post "/signin"=> "session#create"
  get "/users/new"=> "session#new"
  post "/logout"=> "session#destroy"
  root "welcome#home"
  post "/take_ride"=> "session#ride"
end
