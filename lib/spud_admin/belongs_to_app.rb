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
					end
				end
				before_filter :instantize_global_vars
				def instantize_global_vars
					@page_thumbnail = @@page_thumbnail
				end	
			end

		end
		
	end
end