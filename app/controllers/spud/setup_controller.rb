class Spud::SetupController < Spud::ApplicationController
	layout 'spud/setup'
	def index
		logger.debug("---Spud setup form running!")
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "First Time Setup"
		if SpudUser.all.count != 0
				flash[:error] = "Access Denied! This wizard may only be executed when the database is empty."
				logger.debug "We have a user count: " + SpudUser.all.count.to_s
				
				redirect_to new_spud_user_session_url and return
		end

		if request.post?
			@user = SpudUser.new(:login => params[:login],:email => params[:email],:password => params[:password],:password_confirmation => params[:password_confirmation])
			@user.super_admin = true
			if @user.save
				logger.debug "REDIRECTING!"
				session[:return_to] = spud_admin_root_url
				redirect_to new_spud_user_session_url and return
			end
			
			flash[:error] = "Error creating administrative account!"
		end
	end
end
