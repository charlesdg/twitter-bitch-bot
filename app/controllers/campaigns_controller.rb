class CampaignsController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def index
		render :layout => 'application'
	end

	def edit
		render :layout => 'application'
	end

	def new
		render :layout => 'application'
	end
end