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
  get '/auth/facebook/callback' => 'sessions#omniauth'

  resources :runs do 
    resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]
  end 
  resources :reviews, only: [:index]

  resources :users, only: [:new, :create, :show]
  
  #gem or api, submit a photo review a run, nested form run&review at same time
  #would like to collection select for terrain, and also put limit on rating numbers
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
