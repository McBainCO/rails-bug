class RegistrationsController < ApplicationController

  skip_before_action :ensure_current_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if
    @user.errors[:email] << "Missing"
      @user.errors[:password] << "Missing"
      @user.errors[:name] << "Missing"
      @user.errors[:password_confirmation] << "Missing"
      render :new
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end