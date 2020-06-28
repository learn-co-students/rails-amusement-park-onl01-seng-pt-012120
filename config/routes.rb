Rails.application.routes.draw do
  resources :attractions 
  resources :users, only: [:new, :create, :show]
  get 'users/new', to: 'users#new'
  get '/signin', to: 'sessions#new'
  post "/signin", to: "sessions#create"
  delete "/signout", to: "sessions#destroy" 
  root 'welcome#home'
  get 'welcome/home'
  get 'rides/create'
  post "/rides/:id", to: "rides#create", as: "new_ride"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
