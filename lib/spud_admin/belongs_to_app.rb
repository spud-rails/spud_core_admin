module Spud::BelongsToApp
	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods
		def belongs_to_spud_app(name=nil)
			self.class_eval do
				Spud::Core.admin_applications.each do |app|
					if app[:name].parameterize.underscore.to_sym == name
						@@page_thumbnail=app[:thumbnail]
						@@page_application = app
					end
				end
				
				before_filter { |controller|
					@page_thumbnail = @@page_thumbnail
					@page_name = @@page_application[:name]
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
		
	end
end