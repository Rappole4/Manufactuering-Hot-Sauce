Rails.application.routes.draw do

  resources :new_orders
  devise_for :users
  resources :users
  resources :sauces
  root 'sauces#index'
end
