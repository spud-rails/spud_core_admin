class Spud::UsersController < Spud::ApplicationController
	before_filter :require_user
	layout 'spud/admin/detail'
	add_breadcrumb "Settings", :spud_settings_path
	def settings
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "Settings"	
	end

	def update
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "Settings"	
		if @current_user.update_attributes(params[:spud_user])
			flash[:notice] = "User settings saved successfully."
			redirect_to spud_admin_root_url()
		else
			flash[:error] = "There was an error while saving the user."
			render :action => "settings"
		end
	end
end
