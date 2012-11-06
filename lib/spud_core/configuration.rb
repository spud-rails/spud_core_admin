module Spud
  module Core
    include ActiveSupport::Configurable
    config_accessor :site_name,:admin_applications,:sitemap_urls,:multisite_mode_enabled,:multisite_config,:from_address,:site_id,:short_name, :javascripts,:stylesheets
    self.admin_applications = [{:name => "Users",:thumbnail => "spud/admin/users_thumb.png",:url => "/spud/admin/users",:order => 100}]
    self.site_name = "Company Name"
    self.site_id = 0
    self.short_name = 'default'
    self.sitemap_urls = []
    self.javascripts = []
    self.stylesheets = []
    self.multisite_mode_enabled = false
    self.multisite_config = []
    self.from_address = "no-reply@spudengine.com"

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
  end
end
