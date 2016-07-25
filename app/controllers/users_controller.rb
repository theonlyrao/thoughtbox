class UsersController < ApplicationController

  def new
    @user = User.new(password: nil)
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to links_index_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :confirmation)
  end

end
