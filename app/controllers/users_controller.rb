class UsersController < ApplicationController

  def show
    @user = User.new
    user = User.find(params[:id])
    @nickname = current_user.nickname
  end
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
  params.require(:user).permit(:email, :password)
  end

end
