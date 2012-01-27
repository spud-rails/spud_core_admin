class Spud::Admin::ApplicationController < Spud::ApplicationController
	before_filter :require_admin_user
	add_breadcrumb "Dashboard", :spud_admin_root_path
	layout 'spud/admin/application'
	respond_to :html,:json,:xml,:js
	unloadable


	private
	def require_admin_user
		return false if !require_user
		
		if !@current_user.super_admin && current_user_permissions.count == 0
			flash[:error] = "User must be an administrator to view this area."
			redirect_to root_url() and return false
		end
		return true
	end
end