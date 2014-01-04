# require 'spud_core'
# require 'rails'
# require 'action_controller'
# require 'rubygems'
require 'jquery-rails'
require 'retina_tag'
require 'authlogic'
# require 'dynamic_form'
require 'breadcrumbs_on_rails'
require 'will_paginate'
require 'codemirror-rails'
require 'tinymce-rails'

module Spud
  module Core
    class Engine < ::Rails::Engine
      require "#{root}/lib/spud_core/belongs_to_app"
      require "#{root}/lib/spud_core/searchable"

      def self.require_model(model_name)
        require "#{root}/app/models/#{model_name}"
      end

      def self.require_controller(controller_name)
        require "#{root}/app/controllers/#{controller_name}"
      end

      engine_name :spud_core

      initializer :assets do |config|
        Rails.application.config.assets.precompile += [
          "tinymce/plugins/**/*",
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
