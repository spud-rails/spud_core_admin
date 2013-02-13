class Spud::CoreMailer < ActionMailer::Base
  # default_url_options[:host] = request.host_with_port

  def forgot_password_notification(user)
  	@user = user
  	@url = edit_spud_password_reset_url(:id => user.perishable_token)
  	# @url = "/spud/password_resets/#{user.perishable_token}/edit"
  	  	mail(:from =>Spud::Core.from_address,:to => user.email, :subject => "Forgot Password Request from #{Spud::Core.config.site_name}")

  end

end
