class Admins::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admins_users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :withdrawal_status, :image )
  end
end
