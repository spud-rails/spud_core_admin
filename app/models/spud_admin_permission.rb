class SpudAdminPermission < ActiveRecord::Base
	belongs_to :spud_user,:foreign_key => :user_id
	attr_accessible :name,:access

end
