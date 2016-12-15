class SessionsController < ApplicationController

	skip_before_action :require_login

	def new
		if @current_user.nil?
			session[:user_id] = nil
		else
			redirect_to root_path
		end
	end

	def create
		user = User.find_by(mail: params[:mail])
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		respond_to do |format|
			if user && user.authenticate(params[:password])
				format.html { redirect_to root_path(user, anchor: 'overview'), notice: 'Logged in!' }
				format.json { render json: user }
			else
				format.html { render :new }
				format.json { render json: @current_user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: 'Logged out!'
	end
end
