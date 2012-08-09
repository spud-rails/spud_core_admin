module Spud::ApplicationHelper
  def current_site_name
    return Spud::Core.site_name if !Spud::Core.multisite_mode_enabled
    config = Spud::Core.site_config_for_host(request.host_with_port)
    return Spud::Core.site_name if config.blank?

    return config[:site_name]
  end

  def current_site_id
    config = Spud::Core.site_config_for_host(request.host_with_port)
    return config[:site_id] unless config.blank?
  end

end
