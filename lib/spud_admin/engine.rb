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
     
 end
end
end
