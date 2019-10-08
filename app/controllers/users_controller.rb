class UsersController < ApplicationController

  def index
  end

  def show
  end

  def logout
  end

  def edit
    render "users/#{params[:url]}"
  end

end
