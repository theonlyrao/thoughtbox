class UsersController < ApplicationController

  def new
    @user = User.new(password: nil)
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user] = user.id
      redirect_to links_index_path
    else
      redirect_to sign_up_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
