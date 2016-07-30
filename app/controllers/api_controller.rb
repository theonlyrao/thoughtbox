class ApiController < ActionController::Base
  respond_to :json
  helper_method :current_user  

  def current_user
    @current_user ||= User.find(session[:user]) if session[:user]    
  end
end

