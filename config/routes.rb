Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  
  root 'products#index'

  resources :users, only: [:show, :new, :create]

  #商品ページ
  get  'sell',   to: 'products#new',    as: :new_product
  post 'sell',   to: 'products#create', as: :create_product
  resources :products, only: [:new,:create] do
  end

  #マイページ
  get 'mypage',  to: 'mypage#index',    as: :maypage_top


end