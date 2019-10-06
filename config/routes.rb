Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'items#index'

  resources :users, only: [:show, :new, :create]

  #商品ページ
  get  'sell',   to: 'products#new',    as: :new_product
  post 'sell',   to: 'products#create', as: :create_product
  resources :products, only: [:new,:create] do
  end




end