Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :sauces
  root 'sauces#index'
end
