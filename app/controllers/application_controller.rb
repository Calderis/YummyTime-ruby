class ApplicationController < ActionController::Base

  # protect_from_forgery with: :exception
  protect_from_forgery

  helper_method :logged_in?
  helper_method :famous_chiefs
  before_action :require_login

  private

  def logged_in?
    if request.headers["usersession"].to_i != 0
      @current_user ||= User.find(request.headers["usersession"].to_i)
      @profile_presenter = ProfilePresenter.new(@current_user)
    else
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
        @profile_presenter = ProfilePresenter.new(@current_user)
      end
    end
  end

  private

  def require_login
  	logged_in?
  	unless @current_user
  		redirect_to login_url
  	end
  end

  def famous_chiefs
    # puts "———————————————————————————————"
    # puts Follower.group(:followed_id).count
    # puts "———————————————————————————————"
  end

  def profile_presenter
    ProfilePresenter.new(@current_user)
  end
end
