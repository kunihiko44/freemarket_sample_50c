# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
      if @user.save
          redirect_to new_card_path
      else
          render 'new'
      end
  end

  def show
  end




  private

  def user_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :postal_code, :prefecture, :city, :address, :building, :phone)
  end


  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end