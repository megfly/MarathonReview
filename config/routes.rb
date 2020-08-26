Rails.application.routes.draw do

  root to: 'sessions#home'

  #signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #logging in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do 
    resources :runs, only: [:index]
  end 

  resources :runs do 
    resources :reviews, only: [:new, :edit, :index, :show]
  end 
  resources :reviews
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
