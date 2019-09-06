Rails.application.routes.draw do

  root 'items#index'

  #商品ページ
  get 'sell', to: 'products#new', as: :new_product
  post 'sell', to: 'products#create', as: :create_product
  resources :products, only: [:new,:create] do
  end

  root 'mypage#index'

end