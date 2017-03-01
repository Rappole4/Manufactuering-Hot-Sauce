Rails.application.routes.draw do
  
  resources :sauces
  root 'sauces#index'
end
