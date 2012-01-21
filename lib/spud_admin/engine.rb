require 'spud_admin'
require 'rails'
require 'action_controller'
require 'rubygems'
require 'jquery-rails'
require 'authlogic'
require 'dynamic_form'
require 'breadcrumbs_on_rails'
require 'will_paginate'
module Spud
     module Core
 class Engine < Rails::Engine
     engine_name :spud_core
     @@AdminApplications = []
     @@paperclip_storage = :filesystem
     @@s3_credentials = "#{Rails.root}/config/s3.yml"
     def self.add_admin_application(options)
     	#Application Model
     	#Name
     	#thumbnail
     	#description optional
     	#notify_ajax
     	@@AdminApplications.push(options)
     end

     def self.paperclip_storage
          return @@paperclip_storage
     end
     def self.paperclip_storage=(storage)
          @@paperclip_storage = storage
     end
     def self.s3_credentials
          return @@s3_credentials
     end
     def self.s3_credentials=(creds)
          @@s3_credentials=creds
     end


     def self.admin_applications
     	return @@AdminApplications
     end
 end
end
end
