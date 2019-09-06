class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @image = Image.new
  end
  
  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:notice] = "出品が完了しました"
      redirect_to controller: :products, action: :index
    else
      flash[:notice] = "未入力の欄があります"
      render "new"
    end
  end

  def show
    @product = Product.find(params[:id])
    @product = Product.order(created_at: :desc).limit(6)
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :introduction,
      :price,
      :size,
      :state_id,
      :brand,
      :category_id,
      :delivery_date_id,
      :delivery_cost_id,
      :delivery_method_id,
      :prefecture_id
    )
  end


end
