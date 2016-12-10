class ApplicationController < ActionController::Base

  # protect_from_forgery with: :exception
  protect_from_forgery

  helper_method :logged_in?
  helper_method :famous_chiefs
  helper_method :profile_presenter
  before_action :require_login

  private

  def logged_in?
    if request.headers["usersession"].to_i != 0
      @current_user ||= User.find(request.headers["usersession"].to_i)
      puts @current_user.to_json
    else
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
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
    hall_of_fames = []
    scores = Follower.where(follower_type: "user").group(:followed_id).order('followed_id asc').count.first(10)
    scores.each do |score|
      hall_of_fames = hall_of_fames + [User.find(score[0])]
    end
    hall_of_fames
  end

  def profile_presenter
    ProfilePresenter.new(@current_user)
  end
end
