Rails.application.routes.draw do

  root to: 'application#welcome'

  #signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #fb omniauth logging in
  get '/auth/facebook/callback' => 'sessions#create'

  resources :runs do 
    resources :reviews, only: [:new, :edit, :index, :show]
  end 
  resources :reviews

  resources :users 
  #gem or api, 3rd party login, bootstrap, submit a photo review a run, nested form run&review at same time
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
