require 'rails_helper'

describe ProductsController do
  describe 'GET #new' do
    it "newアクションが動いた後、new.html.hamlに遷移するか" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe ProductsController do
    describe 'GET #index' do
      it "renders the :index template" do
      get :index
      expect(response).to render_template :index
      end
    end
  end

    describe 'GET #index' do
      it "assigns the requested product to @products" do
        category = Category.new(name:"aaa")
        name = Name.new(name:"aaa")
        price = Price.new(price:"1000")
        product = create_list(:product,3,category:category,name:name,price:price)

        get :index, params: { id: product }
        expect(assigns(:products)).to eq product
      end
    end



end 

