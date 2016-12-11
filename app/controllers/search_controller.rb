class SearchController < ApplicationController

	def index
	end

	
	def search
		if params[:q].nil?
			@users = []
		else
			@users = User.search params[:q]
		end
	end
end
