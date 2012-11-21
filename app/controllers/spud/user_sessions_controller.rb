class Spud::UserSessionsController < Spud::ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  layout 'spud/login/application'
  def new
    if SpudUser.all.count == 0
      logger.debug "NO USERS!"
      redirect_to spud_core.setup_url() and return
    end

    @user_session = SpudUserSession.new
  end

  def create
    @user_session = SpudUserSession.new(params[:spud_user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default main_app.root_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    if !request.referer.blank?
      session[:return_to] = request.referer
    end
    redirect_back_or_default spud_core.new_user_session_url

  end
end
