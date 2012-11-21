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

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, spud_core.url_for({:sort => column, :direction => direction}), {:class => css_class}
  end

end
