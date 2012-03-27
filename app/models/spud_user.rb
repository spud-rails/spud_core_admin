class SpudUser < ActiveRecord::Base
	has_many :spud_admin_permissions,:foreign_key => :user_id
	accepts_nested_attributes_for :spud_admin_permissions, :allow_destroy => true
	
	attr_accessible :login,:email,:first_name,:last_name,:password,:password_confirmation,:password_salt,:last_login_at,:last_request_at,:last_login_ip,:failed_login_count,:current_login_at,:login_count,:persistence_token,:perishable_token,:single_access_token,:crypted_password, :current_login_ip, :created_at, :updated_at,:spud_admin_permissions_attributes,:time_zone
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
