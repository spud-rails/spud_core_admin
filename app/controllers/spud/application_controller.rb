class Spud::ApplicationController < ActionController::Base
	unloadable
	protect_from_forgery
	helper_method :current_user_session, :current_user
	before_filter :set_time_zone

  private
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
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

    def set_time_zone
      if current_user and current_user.time_zone.blank? == false
        Time.zone = current_user.time_zone 
      else
        Time.zone = Rails.application.config.time_zone
      end
    end
end