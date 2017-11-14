Rails.application.routes.draw do
  root 'stocks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :stocks, only: [:index, :new, :create, :show]
  resources :items, only: [:new, :create]
  resources :images, only: [:new, :create]
end
