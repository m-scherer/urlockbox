class UsersController < ApplicationController

  skip_before_action :logged_in?, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if User.find_by(email: user_params[:email])
      flash[:success] = "Please enter a unique email"
      redirect_to new_user_path
    elsif user_params[:password] != user_params[:password_confirmation]
      flash[:success] = "Passwords do not match"
      redirect_to new_user_path
    elsif user.save
      flash[:success] = "#{user.email} created successfully!"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
