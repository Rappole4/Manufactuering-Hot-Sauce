Rails.application.routes.draw do
  resources :sauces
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sauces#index'
end
