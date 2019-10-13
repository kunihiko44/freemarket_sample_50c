class CardsController < ApplicationController

  require "payjp"

  def pay
    Payjp.api_key = "sk_test_601fb5e6f2e07120aaf7ef8a"
    Payjp::Charge.create(
      amount: 809, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

end

