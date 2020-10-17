class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
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
end
