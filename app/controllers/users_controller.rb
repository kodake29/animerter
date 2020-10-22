class UsersController < ApplicationController

  before_action :login_check

  def show
    @user = User.find(params[:id])
    if @user.id == current_user.id
       @reviews = @user.reviews.page(params[:page]).reverse_order.where(release_status: 0)
    else
      @reviews = @user.reviews.page(params[:page]).reverse_order.where(release_status: 0, private_status: 0)
    end
    @my_lists = MyList.where(user_id: @user.id)
  end


  def edit
  	@user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end


  def confirmation
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(withdrawal_status: 1)
    reset_session
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :withdrawal_status)
  end

  def login_check
    unless user_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to root_path
    end
  end

end
