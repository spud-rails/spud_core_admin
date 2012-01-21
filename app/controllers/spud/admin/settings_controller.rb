class Spud::Admin::SettingsController < Spud::Admin::ApplicationController
	layout 'spud/admin/detail'
	add_breadcrumb "Settings", :spud_admin_settings_path
	def index
		@spud_settings = SpudSetting.all
	end

	def create
		@spud_settings = SpudSetting.all
		if params[:spud_settings].blank?
			flash[:error] = "Spud Settings not specified!"
			redirect_to spud_admin_settings_url()
		end
	end
end
