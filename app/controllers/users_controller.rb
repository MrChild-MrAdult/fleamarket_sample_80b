class UsersController < ApplicationController


  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @products = user.products
    @introduction = user.introduction
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user), notice: '変更されました'
  end

  def logout
  end

  def personal_edit
  end

  private

  def user_params
    params.require(:user).permit(:introduction)
  end

end
