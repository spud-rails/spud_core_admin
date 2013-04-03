class SpudUser < ActiveRecord::Base
	include Concerns::SpudAuthentication

	has_many :spud_admin_permissions,:foreign_key => :user_id
	has_many :spud_user_settings
	accepts_nested_attributes_for :spud_admin_permissions, :allow_destroy => true


	def has_admin_rights?
		return self.super_admin || self.spud_admin_permissions.count > 0
	end

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
