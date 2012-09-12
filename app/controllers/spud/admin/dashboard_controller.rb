class Spud::Admin::DashboardController < Spud::Admin::ApplicationController

	def index
		permission_set = current_user_permissions.collect{|p| p.name}
		@unsorted_applications = Spud::Core.admin_applications.select{|app| @current_user.super_admin || permission_set.include?(app[:name])}.sort_by{|obj| obj[:order]}
		@admin_applications = []

		@app_order = @current_user.spud_user_settings.where(:key => "app_order").first
		if !@app_order.blank?
			names = @app_order.value.split(",")
			names.each do |name|
				@app = @unsorted_applications.select{|app| app[:name] == name}
				@unsorted_applications = @unsorted_applications.reject{|app| app[:name] == name}
				@admin_applications += @app
			end
			@admin_applications += @unsorted_applications
		else
			@admin_applications = @unsorted_applications
		end
	end

  def switch
    if !params[:multisite_select].blank?
      if Spud::Core.multisite_config.select{|p| p[:site_id].to_i == params[:multisite_select].to_i}.blank? == false
        session[:admin_site] = params[:multisite_select].to_i
      else
        flash[:error] = "Site does not exist."
      end
    else
      session[:admin_site] = 0
    end
    redirect_to(back_or_default(!request.referer.blank? ? request.referer : spud_admin_root_path)) and return
  end
end
