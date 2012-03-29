class Spud::Admin::DashboardController < Spud::Admin::ApplicationController
  
	def index
		permission_set = current_user_permissions.collect{|p| p.name}
		@admin_applications = Spud::Core.admin_applications.select{|app| @current_user.super_admin || permission_set.include?(app[:name])}
	end

	def switch
		if params[:multisite_select].blank?
			# flash[:error] = "Site variable does not exist."
			session[:admin_site] = nil
			redirect_to request.referer and return
		end	
		if Spud::Core.multisite_config.select{|p| p[:site_id].to_i == params[:multisite_select].to_i}.blank? == false
			session[:admin_site] = params[:multisite_select].to_i
		else
			flash[:error] = "Site does not exist."
		end
		redirect_to request.referer and return
	end
end