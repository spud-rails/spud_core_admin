class Spud::Admin::DashboardController < Spud::Admin::ApplicationController
  
	def index
		permission_set = current_user_permissions.collect{|p| p.name}
		@admin_applications = Spud::Core.admin_applications.select{|app| @current_user.super_admin || permission_set.include?(app[:name])}
	end
end