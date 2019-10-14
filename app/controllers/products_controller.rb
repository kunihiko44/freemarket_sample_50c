class ProductsController < ApplicationController

  require "payjp"
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:edit, :update, :show, :destroy, :confirm, :pay]

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
      redirect_to root_path
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
    @product.destroy if @product.user.id === current_user.id
    redirect_to root_path
  end

  def confirm
    @products = Product.includes(:images)
  end

  def pay
    Payjp.api_key = "sk_test_601fb5e6f2e07120aaf7ef8a"
    Payjp::Charge.create(
      amount: @product.price, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
      redirect_to root_path
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
      redirect_to root_path
    else
      render :edit
    end
  end

end
