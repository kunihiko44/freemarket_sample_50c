class ProductsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :show, :destroy]

  def index
    @products = Product.includes(:images)
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
      redirect_to controller: :products, action: :new
    else
      flash[:notice] = "画像がない、もしくは未入力の欄があります"
      render action: :new
    end
  end

  def show
    @products = Product.includes(:images)
    
  end

  def edit
    @image = Image.new
  end

  def update
    if @product.update(product_params) 
      remove_product_images
    else
      render :edit
    end
  end

  def destroy
    @product.destroy if @product.user_id === current_user.id
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
    ).merge(user_id: current_user.id)
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

  def set_product
    @product = Product.find(params[:id])
  end

  def remove_product_images
    @product.images.each do |image|
      image.destroy
    end
    if save_images(@product, image_params)
      redirect_to controller: :products, action: :new
    else
      render :edit
    end
  end

end
