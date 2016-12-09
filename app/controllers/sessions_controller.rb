class SessionsController < ApplicationController

	skip_before_action :require_login

	def new
	end

	def create
		user = User.find_by(mail: params[:mail])
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		respond_to do |format|
			if user && user.authenticate(params[:password])
				session[:user_id] = user.id
				result = Hash.new(0)
				result[:token] = form_authenticity_token
				result[:user] = user.authenticate(params[:password])
				format.html { redirect_to root_url, notice: 'Logged in!' }
				format.json { render json: result, status: :created }
			else
				format.html { render :new }
				format.json { render json: @users.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, notice: 'Logged out!'
	end
end
