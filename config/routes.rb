Rails.application.routes.draw do
  get 'products/search', to: 'products#search'
  
  resources :products do
    resources :deals, only: [ :new, :create]
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :profiles
  devise_for :users
  root to: 'home#index'

  
end
