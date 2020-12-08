class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @products = user.products
  end

  def edit
  end

  def logout
  end

  def personal_edit
  end

end
