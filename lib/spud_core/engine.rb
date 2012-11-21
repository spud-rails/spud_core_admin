require 'jquery-rails'
require 'retina_tag'
require 'authlogic'
require 'will_paginate'

module Spud
  module Core
    class Engine < ::Rails::Engine
      require "#{root}/lib/spud_core/breadcrumbs"
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
          "tiny_mce/plugins/**/*",
          "tiny_mce/themes/advanced/*",
          "tiny_mce/utils/*",
          "tiny_mce/langs/*"
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
