Rails.application.routes.draw do
  resources :orderitems, only: [:create, :destroy]
  # resources :restitems
  resources :orders, only: [:update]
  resources :restaurants, only: [:show, :index]
  resources :users, only: [:index, :show, :create, :destroy] 
  # resources :categories
  resources :items, only: [:show, :index]
  post '/charges', to: 'charges#create'

  post '/login', to: 'users#login'
  get '/persist', to: 'users#persist'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
