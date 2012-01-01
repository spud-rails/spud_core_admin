class Spud::Admin::DashboardController < Spud::Admin::ApplicationController
  
	def index
		@admin_applications = SpudAdmin::Engine.admin_applications
	end
end