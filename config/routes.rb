Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  root to: 'home#index'
end
