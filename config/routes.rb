Rails.application.routes.draw do
  root 'products#index'

  #商品ページ
  get 'sell', to: 'products#new'
  post 'sell', to: 'products#create'
  resources :products
end
