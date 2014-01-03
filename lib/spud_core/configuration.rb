module Spud
  module Core
    include ActiveSupport::Configurable
    config_accessor :site_name,:admin_applications,:sitemap_urls,:multisite_mode_enabled,:multisite_config,:from_address,:site_id,:short_name, :javascripts,:stylesheets, :admin_javascripts, :admin_stylesheets, :renderers
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
    self.renderers = {'HTML' => {:description => 'Formatted Html', :class => nil}, 'RAW' => {:description => "Raw", :class => nil}}
    self.admin_javascripts = ['spud/admin/application']
    self.admin_stylesheets = ['spud/admin/application']

    def self.renderer(name)
      puts Spud::Core.config.renderers
      renderer_definition = Spud::Core.config.renderers[name]
      if renderer_definition && renderer_definition[:class]
        return renderer_definition[:class]
      else
        return nil
      end
    end

    def self.site_config_for_host(host)
      configs = Spud::Core.config.multisite_config.select{|p| p[:hosts].include?(host)}
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
