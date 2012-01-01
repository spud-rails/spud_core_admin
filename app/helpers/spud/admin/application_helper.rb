module Spud::Admin::ApplicationHelper
	def timestamp(timedate)
			return "Never" if timedate.blank?
			return Time.now() - timedate > 604800 ? timedate.strftime("%B %d") + ' at ' + timedate.strftime("%I:%M %p") : time_ago_in_words(timedate) + ' ago'
	end
end