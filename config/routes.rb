Rails.application.routes.draw do
  # resources :orderitems
  # resources :restitems
  # resources :orders
  resources :restaurants, only: [:show, :index]
  resources :users, only: [:index, :show, :create, :destroy] 
  # resources :categories
  resources :items, only: [:show, :index]

  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
