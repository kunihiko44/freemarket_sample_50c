Rails.application.routes.draw do

  root 'products#index'

  #商品ページ
  resources :products, only: [:new,:create] do
  end

  
  root 'mypage#index'
  root 'items#index'

end
