class LoginsController < ApplicationController
  def new
    redirect_to posts_path if current_user
    @user = User.new
  end

  def create
    @user = User.find_by(login_params)

    if @user
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash[:alert] = "Email or Password is wrong!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil     
    redirect_to new_login_path 
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
