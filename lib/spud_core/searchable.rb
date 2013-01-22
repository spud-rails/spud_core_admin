module Spud::Searchable
	extend ActiveSupport::Concern
	included do
		extend ClassMethods
	end
	module ClassMethods
		def spud_searchable
			# puts "Place Holder For #{self.name}"
		end
	end
end
