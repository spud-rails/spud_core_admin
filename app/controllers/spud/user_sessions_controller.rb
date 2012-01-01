class Spud::UserSessionsController < Spud::ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  layout 'spud/login'
  def new
    if SpudUser.count == 0
      redirect_to spud_setup_url() and return
    end

    @user_session = SpudUserSession.new
  end
  
  def create
    @user_session = SpudUserSession.new(params[:spud_user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_spud_user_session_url
  end
end
