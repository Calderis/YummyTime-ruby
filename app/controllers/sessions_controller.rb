class SessionsController < ApplicationController

	skip_before_action :require_login

	def new
	end

	def create
		user = User.find_by(mail: params[:mail])
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_url, notice: 'Logged in!'
		else
			flash.now.alert = 'Email or password is invalid'
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: 'Logged out!'
	end
end
