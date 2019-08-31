require 'rails_helper'

describe Product do
  describe '#create' do
    it "nameが存在しなければ登録できない" do
      product = Product.new(name: "", introduction: "テスト", category_id: "1", size: "", state_id: "1", delivery_cost_id: "1", delivery_method_id: "1", prefecture_id: "1", price: "980", brand: "", delivery_date_id: "1")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "introductionが存在しなければ登録できない" do
      product = Product.new(name: "テスト", introduction: "", category_id: "1", size: "", state_id: "1", delivery_cost_id: "1", delivery_method_id: "1", prefecture_id: "1", price: "980", brand: "", delivery_date_id: "1")
      product.valid?
      expect(product.errors[:introduction]).to include("can't be blank")
    end
  end
end
