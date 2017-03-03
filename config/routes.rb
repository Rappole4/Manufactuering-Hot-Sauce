Rails.application.routes.draw do

  resources :factories
  resources :ingredients
  devise_for :users
  resources :users
  resources :sauces
  resources :orders
  root 'sauces#index'
end
