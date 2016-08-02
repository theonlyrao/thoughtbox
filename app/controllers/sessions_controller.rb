class SessionsController < ApplicationController

  def new
    @user = User.new(password: nil)
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user
      session[:user] = @user.id
      redirect_to links_index_path
    end
  end

  def destroy
    session.clear
    flash[:success] = "You have signed out."
    redirect_to login_path
  end

end
