class SpudUser < ActiveRecord::Base

	attr_protected :super_admin
	acts_as_authentic do |c|
    # c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
	end # block optional

	def full_name
		if first_name.blank? && last_name.blank?
			return self.login
		end
		return "#{self.first_name} #{self.last_name}"
	end
end
