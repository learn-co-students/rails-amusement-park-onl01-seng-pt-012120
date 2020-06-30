Rails.application.routes.draw do
  get '/users/new' => 'users#new'
  post '/users/new' => 'users#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/users/:id' => 'users#show'
  get '/logout' => 'sessions#destroy'
  root 'users#home'
  resources :attractions
  post '/attractions/:id/ride' => 'attractions#ride'
end
