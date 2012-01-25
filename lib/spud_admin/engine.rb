require 'spud_admin'
require 'rails'
require 'action_controller'
require 'rubygems'
require 'jquery-rails'
require 'authlogic'
require 'dynamic_form'
require 'breadcrumbs_on_rails'
require 'will_paginate'
require 'spud_admin/belongs_to_app'
module Spud
     module Core
 class Engine < Rails::Engine
     engine_name :spud_core
     initializer :assets do |config| 
     	Rails.application.config.assets.precompile += [ 
    	   "jquery.wymeditor.pack.js",
           "wymeditor/*", 
           "wymeditor/lang/*", 
           "wymeditor/skins/default/*", 
           "wymeditor/skins/default/**/*",
           "spud/admin*"
        ]
     end

     initializer :controller_overrides do |config|
     	ActionController::Base.class_eval do
     		include Spud::BelongsToApp
     	end
     end
     
 end
end
end
