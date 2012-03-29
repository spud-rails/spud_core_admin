class SpudUserSetting < ActiveRecord::Base
	belongs_to :spud_user

	validates :key,:presence=>true
	validates_uniqueness_of :key,:scope => :spud_user_id
end
