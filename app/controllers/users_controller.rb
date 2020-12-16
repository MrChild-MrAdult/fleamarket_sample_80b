class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @products = user.products
    @introduction = user.introduction
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: '変更されました'
    else
      flash.now[:alert] = 'エラーです'
      render :edit
    end
  end

  def logout
  end

  def personal_edit
  end

  private

  def user_params
    params.require(:user).permit(:introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
