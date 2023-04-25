class UserController < ApplicationController
  def login
    @user = params[:user]
  end

  def signup
    @user = User.new()
  end

  def create
    @user = User.new(login_params)
    if @user.save
      flash[:notice] = "User created successfully!"
      redirect_to user_signin_path
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to user_signup_path
    end
  end

  private

  def login_params
    params.require(:user).permit(:name, :email, :password)
  end
end
