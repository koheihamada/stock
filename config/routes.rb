Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,  :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  root 'stocks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :stocks, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end

  resources :items, only: [:new, :create]
  resources :images, only: [:new, :create]
  resources :users, only: [:edit, :show, :index, :destroy]
  resources :brands, only: [:show]

  post   '/stocks/:item_id/sell' => 'stocks#sell',   as: 'sell'
  post   '/stocks/:item_id/buy' => 'stocks#buy',     as: 'buy'
  get   '/stocks/:item_id/payment' => 'stocks#payment',     as: 'payment'
  post   '/stocks/:item_id/payment' => 'stocks#payment_confirm',     as: 'payment_confirm'
  get   '/stocks/:item_id/selling' => 'stocks#selling',     as: 'selling'
  post '/stocks/:item_id/selling' => 'stocks#selling_confirm', as: 'selling_confirm'
end
