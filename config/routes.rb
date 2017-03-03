Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :sauces
  resources :orders
  resources :ingredients
  resources :factories
  root 'sauces#index'
end
