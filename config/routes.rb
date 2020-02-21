Rails.application.routes.draw do
  resources :orderitems
  resources :restitems
  resources :orders
  resources :restaurants
  resources :users
  resources :categories
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
