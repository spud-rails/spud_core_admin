# require 'spud_core'
# require 'rails'
# require 'action_controller'
# require 'rubygems'
require 'jquery-rails'
require 'authlogic'
# require 'dynamic_form'
require 'breadcrumbs_on_rails'
require 'will_paginate'

module Spud
  module Core
    class Engine < ::Rails::Engine
      require 'spud_core/belongs_to_app'
      require 'spud_core/searchable'
      engine_name :spud_core
      initializer :assets do |config| 
      	Rails.application.config.assets.precompile += [ 
         "jquery.wymeditor.pack.js",
           "wymeditor/*", 
           "wymeditor/lang/*", 
           "wymeditor/skins/default/*", 
           "wymeditor/skins/default/**/*",
           "tiny_mce/plugins/**/*",
           "tiny_mce/themes/**/*",
           "tiny_mce/utils/*",
           "tiny_mce/langs/*",
           "tiny_mce/*",
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
