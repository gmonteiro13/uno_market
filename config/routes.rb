Rails.application.routes.draw do
  resources :products
  resources :profiles
  devise_for :users
  root to: 'home#index'
end
