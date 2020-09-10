Rails.application.routes.draw do
  get 'products/search', to: 'products#search'
  resources :products
  resources :profiles
  devise_for :users
  root to: 'home#index'

  
end
