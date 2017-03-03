Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :sauces
  resources :orders
  root 'sauces#index'
end
