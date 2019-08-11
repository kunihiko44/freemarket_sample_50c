class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new
    @product.save
    redirect_to new_product_path
  end
end
