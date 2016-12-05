class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery

  private

  def logged_in?
  	if session[:user_id]
  		@current_user ||= User.find(session[:user_id]) 
  	end
  end

  helper_method :logged_in?

  before_action :require_login

  private

  def require_login
  	logged_in?
  	unless @current_user
  		redirect_to login_url
  	end
  end
end
