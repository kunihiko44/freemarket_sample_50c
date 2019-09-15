require 'rails_helper'

describe Product do
  describe '#create' do

    it "必須項目が全て存在すれば登録できる" do
      product = build(:product)
      expect(product).to be_valid
    end

    it "nameが存在しなければ登録できない" do
      product = build(:product,name: "")
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "introductionが存在しなければ登録できない" do
      product = build(:product,introduction: "")
      product.valid?
      expect(product.errors[:introduction]).to include("can't be blank")
    end

    it "category_idが存在しなければ登録できない" do
      product = build(:product,category_id: "")
      product.valid?
      expect(product.errors[:category]).to include("can't be blank")
    end

    it "state_idが存在しなければ登録できない" do
      product = build(:product,state_id: "")
      product.valid?
      expect(product.errors[:state]).to include("can't be blank")
    end

    it "delivery_cost_idが存在しなければ登録できない" do
      product = build(:product,delivery_cost_id: "")
      product.valid?
      expect(product.errors[:delivery_cost]).to include("can't be blank")
    end

    it "delivery_method_idが存在しなければ登録できない" do
      product = build(:product,delivery_method_id: "")
      product.valid?
      expect(product.errors[:delivery_method]).to include("can't be blank")
    end

    it "prefecture_idが存在しなければ登録できない" do
      product = build(:product,prefecture_id: "")
      product.valid?
      expect(product.errors[:prefecture]).to include("can't be blank")
    end

    it "priceが存在しなければ登録できない" do
      product = build(:product,price: "")
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "delivery_date_idが存在しなければ登録できない" do
      product = build(:product,delivery_date_id: "")
      product.valid?
      expect(product.errors[:delivery_date]).to include("can't be blank")
    end

    it "nameが41文字以上では登録できない" do
      product = build(:product, name: "aaaaaaaaaabbbbbbbbbbccccccccccdddddddddde")
      product.valid?
      expect(product.errors[:name][0]).to include("is too long")
    end

    it "nameが40文字以下であれば登録できる" do
      product = build(:product, name: "aaaaaaaaaabbbbbbbbbbccccccccccdddddddddd")
      expect(product).to be_valid
    end

    it "introductionが1001文字以上では登録できない" do
      product = build(:product, introduction: "aaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjk")
      product.valid?
      expect(product.errors[:introduction][0]).to include("is too long")
    end

    it "introductionが1000文字以下であれば登録できる" do
      product = build(:product, introduction: "aaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjjaaaaaaaaaabbbbbbbbbbccccccccccddddddddddeeeeeeeeeeffffffffffgggggggggghhhhhhhhhhiiiiiiiiiijjjjjjjjjj")
      expect(product).to be_valid
    end

    it "priceが299以下では登録できない" do
      product = build(:product, price: "299" )
      product.valid?
      expect(product.errors[:price]).to include("must be greater than or equal to 300")
    end

    it "priceが300以上であれば登録できる" do
      product = build(:product, price: "300" )    
      expect(product).to be_valid
    end

    it "priceが9999999以下であれば登録できる" do
      product = build(:product, price: "9999999" )    
      expect(product).to be_valid
    end

    it "priceが10000000以上では登録できない" do
      product = build(:product, price: "10000000" )
      product.valid?    
      expect(product.errors[:price]).to include("must be less than or equal to 9999999")
    end



  end
end