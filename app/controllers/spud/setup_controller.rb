class Spud::SetupController < Spud::ApplicationController
	layout 'spud/setup'
	def index
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "First Time Setup"
		if SpudUser.count != 0
				flash[:error] = "Access Denied! This wizard may only be executed when the database is empty."
				redirect_to new_spud_user_session_url and return
		end

		if request.post?
			@user = SpudUser.new(:login => params[:login],:email => params[:email],:password => params[:password],:password_confirmation => params[:password_confirmation])
			@user.super_admin = true
			if @user.save
				redirect_back_or_default(new_spud_user_session_url) and return
			end

			flash[:error] = "Error creating administrative account!"
		end
	end
end
