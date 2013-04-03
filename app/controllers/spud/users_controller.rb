class Spud::UsersController < Spud::ApplicationController
	before_filter :require_user
	layout 'spud/admin/detail'

	def settings
		if current_user.has_admin_rights?
			add_breadcrumb "Dashboard", :spud_admin_root_path
		end
		add_breadcrumb "Settings", :spud_settings_path
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "Settings"
	end

	def update

		add_breadcrumb "Settings", :spud_settings_path
		@page_thumbnail = "spud/admin/users_thumb.png"
		@page_name = "Settings"
		if @current_user.update_attributes(user_params)
			flash[:notice] = "User settings saved successfully."
			redirect_to spud_admin_root_url()
		else
			flash[:error] = "There was an error while saving the user."
			render :action => "settings"
		end
	end


	def save_setting
		if params[:key].blank?
			render :status => 500,:text => nil and return
		end

		setting = @current_user.spud_user_settings.where(:key => params[:key]).first
		if setting.blank?
			setting = @current_user.spud_user_settings.new(:key => params[:key])
		end
		setting.value = params[:value]
		if setting.save
			render :status => 200,:text => nil and return
		else
			render :status => 500,:text => nil and return
		end
	end

private
	def user_params
		params.require(:spud_user).permit(:login,:first_name,:last_name,:email,:password,:password_confirmation,:time_zone)
	end

end
