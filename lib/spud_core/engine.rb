require 'spud_core'
require 'rails'
require 'action_controller'
require 'rubygems'
require 'jquery-rails'
require 'authlogic'
# require 'dynamic_form'
require 'breadcrumbs_on_rails'
require 'will_paginate'
require 'spud_core/belongs_to_app'
require 'spud_core/searchable'
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
     initializer :model_overrides do |config| 
      ActiveRecord::Base.class_eval do
        include Spud::Searchable
      end
     end

     
 end
end
end
