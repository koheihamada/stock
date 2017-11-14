Rails.application.routes.draw do
  devise_for :users
  root 'stocks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :stocks, only: [:index, :new, :create, :show]
  resources :items, only: [:new, :create]
  resources :images, only: [:new, :create]

  post   '/stocks/:item_id/sell' => 'stocks#sell',   as: 'sell'
  post   '/stocks/:item_id/buy' => 'stocks#buy',     as: 'buy'
  post   '/stocks/:item_id/payment' => 'stocks#payment',     as: 'payment'
end
