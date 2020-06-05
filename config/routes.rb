Rails.application.routes.draw do
  root 'welcome#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :attractions, only: [:index,:show,:new,:create,:edit,:update]
  resources :rides
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
