class Spud::UsersController < Spud::ApplicationController
	before_filter :require_user
	layout 'spud/admin/detail'

	def settings
		add_breadcrumb "Settings", :spud_settings_path
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "Settings"	
	end

	def update
		
		add_breadcrumb "Settings", :spud_settings_path
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "Settings"	
		if @current_user.update_attributes(params[:spud_user].slice :login,:first_name,:last_name,:email,:password,:password_confirmation,:time_zone)
			flash[:notice] = "User settings saved successfully."
			redirect_to spud_admin_root_url()
		else
			flash[:error] = "There was an error while saving the user."
			render :action => "settings"
		end
	end
end
