module Spud
  module Core
    include ActiveSupport::Configurable
    config_accessor :site_name,:admin_applications,:sitemap_urls,:multisite_mode_enabled,:multisite_config,:from_address,:site_id,:short_name, :admin_javascripts, :admin_stylesheets, :user_model, :automount
    self.user_model = "SpudUser"
    self.automount = true
    self.admin_applications = [{:name => "Users",:thumbnail => "spud/admin/users_thumb.png",:url => {:controller => "/spud/admin/users"},:order => 100}]
    self.site_name = "Company Name"
    self.site_id = 0
    self.short_name = 'default'
    self.sitemap_urls = []
    self.multisite_mode_enabled = false
    self.multisite_config = []
    self.from_address = "no-reply@spudengine.com"

    self.admin_javascripts = ['spud/admin/application']
    self.admin_stylesheets = ['spud/admin/application']

    def self.site_config_for_host(host)
      configs = Spud::Core.multisite_config.select{|p| p[:hosts].include?(host)}
      if configs.blank?
        return default_site_config
      else
        return configs[0]
      end
    end

    def self.site_config_for_id(id)
      if(id == Spud::Core.config.site_id)
        return self.default_site_config
      else
        matches = Spud::Core.config.multisite_config.select{ |site| site[:site_id] == id }
        return matches[0] if matches.any?
      end
    end

    def self.default_site_config
      return {:site_id => Spud::Core.config.site_id, :site_name => Spud::Core.config.site_name, :short_name => Spud::Core.config.short_name}
    end

    def self.append_admin_javascripts(*args)
      if args[0].class == Array
        Spud::Core.config.admin_javascripts += args[0]
      else
        Spud::Core.config.admin_javascripts += args
      end
    end

    def self.append_admin_stylesheets(*args)
      if args[0].class == Array
        Spud::Core.config.admin_stylesheets += args[0]
      else
        Spud::Core.config.admin_stylesheets += args
      end
    end

  end
end
