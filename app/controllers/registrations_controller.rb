class RegistrationsController < ApplicationController

  def new
    redirect_to posts_path if current_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_login_path
    else
      flash[:alert] = "Couldn't save the User!"
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
