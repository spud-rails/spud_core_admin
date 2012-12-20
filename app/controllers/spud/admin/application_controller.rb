class Spud::Admin::ApplicationController < Spud::ApplicationController
	before_filter :require_admin_user
	before_filter :verify_site_mode
	add_breadcrumb "Dashboard", {:controller => "/spud/admin/dashboard",:action => :index}
	layout 'spud/admin/application'
	respond_to :html,:json,:xml,:js
  helper_method :sort_column, :sort_direction
	unloadable

  def current_admin_site
    if(session[:admin_site] == nil)
      return 0
    else
      return session[:admin_site]
    end

  end

private

  def sort_column
    params[:sort]
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

	def require_admin_user
    return false if !require_user
    if !@current_user.super_admin && current_user_permissions.count == 0
      store_location
			flash[:error] = "User must be an administrator to view this area."
			redirect_to root_url
		end
		return true
	end

	def verify_site_mode
		if(session[:admin_site] == nil)
	    session[:admin_site] = 0
		end
	end

  def enable_responsive_layout
    @body_class = "responsive"
  end

	def multisite_caching
    if Spud::Core.multisite_mode_enabled
      @old_cache_directory = Rails.application.config.action_controller.page_cache_directory
      if(@old_cache_directory.blank?)
        @old_cache_directory = Rails.application.config.action_controller.page_cache_directory = File.join(Rails.root,'public')
      end
      if session && session[:admin_site]
        site_config = Spud::Core.site_config_for_id(session[:admin_site])
      else
        site_config = Spud::Core.site_config_for_host(request.host_with_port)
      end
      self.class.page_cache_directory = File.join(@old_cache_directory.to_s, site_config[:short_name].to_s.downcase)
      logger.debug "Cache directory set to: #{Rails.application.config.action_controller.page_cache_directory}"
    end
  end
end
