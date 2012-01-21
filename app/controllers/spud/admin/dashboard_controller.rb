class Spud::Admin::DashboardController < Spud::Admin::ApplicationController
  
	def index
		@admin_applications = Spud::Core.admin_applications
	end
end