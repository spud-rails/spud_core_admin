class Spud::ApplicationController < ActionController::Base
	unloadable
	protect_from_forgery
	helper_method :current_user_session, :current_user, :current_site_name
	around_filter :set_time_zone
  around_filter :multisite_caching
  before_filter :to


  def current_site_name
    # puts "request.host_with_port = #{request.host_with_port}"
    return Spud::Core.site_name if !Spud::Core.multisite_mode_enabled
    config = Spud::Core.site_config_for_host(request.host_with_port)
    return Spud::Core.site_name if config.blank?

    return config[:site_name]
  end

  private

    def to
      ActionMailer::Base.default_url_options = {:host => request.host_with_port}
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = SpudUserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.spud_user
    end

    def current_user_permissions
      return @current_user_permissions if defined?(@current_user_permissions)
      @current_user_permissions = current_user.spud_admin_permissions.where(:access => true).all
    end

    def require_user
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_spud_user_session_url
        return false
      end
      return true
    end

    def require_no_user
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.url
    end

    def redirect_back_or_default(default)
      redirect_to(back_or_default(default))
    end

    def back_or_default(default)
      result = !session[:return_to].blank? ? session[:return_to] : default
      session[:return_to] = nil
      return result
    end

    def set_time_zone
      old_time_zone = Time.zone
      Time.zone = current_user.time_zone if current_user and current_user.time_zone.blank? == false
      yield
    ensure
      Time.zone = old_time_zone
    end

    def multisite_caching
      if Spud::Core.multisite_mode_enabled
        old_cache_directory = Rails.application.config.action_controller.page_cache_directory
        if(old_cache_directory.blank?)
          old_cache_directory = Rails.application.config.action_controller.page_cache_directory = File.join(Rails.root,'public')
        end
        site_config = Spud::Core.site_config_for_host request.host_with_port
        if !site_config.blank?
          Rails.application.config.action_controller.page_cache_directory = File.join(old_cache_directory.to_s,site_config[:short_name].to_s)
        else
          Rails.application.config.action_controller.page_cache_directory = File.join(old_cache_directory.to_s,"main")
        end
      end

      yield

    ensure
      Rails.application.config.action_controller.page_cache_directory = old_cache_directory

    end
end
