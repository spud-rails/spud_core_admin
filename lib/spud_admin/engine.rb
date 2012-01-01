require 'spud_admin'
require 'rails'
require 'action_controller'
require 'rubygems'
require 'jquery-rails'
require 'authlogic'
require 'dynamic_form'
require 'breadcrumbs_on_rails'
require 'will_paginate'
module SpudAdmin 
 class Engine < Rails::Engine
     engine_name :spud_admin
     @@AdminApplications = [{:name => "Users",:thumbnail => "spud/admin/users_thumb.png",:url => "/spud/admin/users",:order => 100}]

     def self.add_admin_application(options)
     	#Application Model
     	#Name
     	#thumbnail
     	#description optional
     	#notify_ajax
     	@@AdminApplications.push(options)
     end

     def self.admin_applications
     	return @@AdminApplications
     end
 end
end
