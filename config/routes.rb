Rails.application.routes.draw do
  get 'mypage/index'
  root 'items#index'
end
