Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  root 'products#index'
  get 'logout' => 'users#logout'
  get 'confirm' => 'products#confirm'
  get 'pay' => 'cards#pay'

  resources :users, only: [:show, :new, :create, :index,]

  #商品ページ
  get  'sell',   to: 'products#new',    as: :new_product
  post 'sell',   to: 'products#create', as: :create_product
  resources :products, only: [:new,:create,:show,:edit,:update] do
  end




end