class Spud::PasswordResetsController < Spud::ApplicationController
	before_filter :require_no_user, :only => [:new, :create]
	before_filter :load_user_using_perishable_token, :only => [:edit, :update]

	layout 'spud/login/application'

	def new
		render
	end

	def create
		@user = SpudUser.find_by_email(params[:email])
		if @user
			Spud::CoreMailer.forgot_password_notification(@user).deliver
			flash[:notice] = "Instructions to reset your password have been emailed to you. " +
			"Please check your email."
			redirect_to spud_core.new_user_session_url
		else
			flash[:notice] = "No user was found with that email address"
			render :action => :new
		end
	end

	def edit
		render
	end

	def update
		@user.password = params[:spud_user][:password]
		@user.password_confirmation = params[:spud_user][:password_confirmation]
		if @user.save
			flash[:notice] = "Password successfully updated"
			redirect_to spud_core.new_user_session_url
		else
			render :action => :edit
		end
	end

private
	def load_user_using_perishable_token
		@user = SpudUser.find_using_perishable_token(params[:id])
		unless @user
			flash[:notice] = "We're sorry, but we could not locate your account. " +
			"If you are having issues try copying and pasting the URL " +
			"from your email into your browser or restarting the " +
			"reset password process."
			redirect_to spud_core.new_user_session_url
		end
	end
end
