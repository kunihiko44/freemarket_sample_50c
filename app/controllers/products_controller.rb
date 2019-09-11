class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @image = Image.new
  end
  
  def create
    @product = Product.new(product_params)
    @image = Image.new
    if @product.save & save_images(@product,image_params)
      flash[:notice] = "出品が完了しました"
      redirect_to controller: :products, action: :index
    else
      flash[:notice] = "画像がない、もしくは未入力の欄があります"
      render action: :new
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

  def image_params
    params.require(:images).require(:name).permit(params[:images][:name].keys) if params[:images].present?
  end

  def save_images(product, images)
    if images.present?
      return false if product.id.blank?
      images.values.each do |name|
        @image = product.images.create(name: name)
      end
    else
      return false
    end
  end

end
