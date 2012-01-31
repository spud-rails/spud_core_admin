class SpudUser < ActiveRecord::Base
	has_many :spud_admin_permissions,:foreign_key => :user_id
	accepts_nested_attributes_for :spud_admin_permissions, :allow_destroy => true
	attr_protected :super_admin

	acts_as_authentic do |c|
    # c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
	end # block optional

	def full_name
		if first_name.blank? && last_name.blank?
			return self.login
		end
		if self.first_name.blank?
			return self.last_name
		elsif self.last_name.blank?
			return self.first_name
		end
		return "#{self.first_name} #{self.last_name}"
	end
end
