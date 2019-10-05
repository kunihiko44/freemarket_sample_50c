Rails.application.routes.draw do

  root 'products#index'

  #商品ページ
  get  'sell',   to: 'products#new',    as: :new_product
  post 'sell',   to: 'products#create', as: :create_product
  resources :products, only: [:new,:create] do
  end

  #マイページ
  get 'mypage',  to: 'mypage#index',    as: :maypage_top


end