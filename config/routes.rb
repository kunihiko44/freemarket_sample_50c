Rails.application.routes.draw do
  root 'items#index'

  #商品ページ
  get 'sell', to: 'items#new'
end
