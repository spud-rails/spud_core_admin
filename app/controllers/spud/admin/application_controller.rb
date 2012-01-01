class Spud::Admin::ApplicationController < Spud::ApplicationController
	before_filter :require_admin_user
	add_breadcrumb "Dashboard", :spud_admin_root_path
	layout 'spud/admin/application'
	unloadable


	private
	def require_admin_user
		return false if !require_user
		if !@current_user.super_admin
			flash[:error] = "User must be an administrator to view this area."
			redirect_to root_url() and return false
		end
		return true
	end
end