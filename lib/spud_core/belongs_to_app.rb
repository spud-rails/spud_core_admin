module Spud::BelongsToApp
	extend ActiveSupport::Concern
	included do
		extend ClassMethods
	end
    # class Config
    # 	attr_reader :page_application
    # 	attr_reader :page_thumbnail
    # 	def initialize(app,thumb)
    # 		@page_application = app
    # 		@page_thumbnail = thumb
    # 	end
    # end
	module ClassMethods
		def belongs_to_spud_app(name=nil)
			
			Spud::Core.admin_applications.each do |app|
					if app[:name].parameterize.underscore.to_sym == name
						@page_application = app
						break
					end
				end
			self.class_eval do

				before_filter { |controller|
					@page_thumbnail = self.class.page_application[:thumbnail]
					@page_name = self.class.page_application[:name]

					if current_user.super_admin == false
						permission = current_user_permissions.select{|perm| perm.name == @page_name}
						if permission.blank?
							flash[:error] = "You do not have access to this area."
							redirect_to spud_admin_root_url and return
						end
					end

					if controller.action_name == 'new' || controller.action_name == 'create'
						@page_name = "New #{@page_name.singularize}"
					elsif controller.action_name == 'edit' || controller.action_name == 'update'
							@page_name = "Edit #{@page_name.singularize}"
					elsif controller.action_name == 'show'
						@page_name = "Show #{@page_name.singularize}"
					end

				}
					
			end

		end
		def page_application
		      @page_application || self.superclass.instance_variable_get('@page_application')
	    end
	end
end