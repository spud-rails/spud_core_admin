module Spud::Admin::ApplicationHelper

  def timestamp(timedate=nil)
    return "Never" if timedate.blank?
    return Time.now() - timedate > 604800 ? timedate.strftime("%B %d") + ' at ' + timedate.strftime("%I:%M %p") : time_ago_in_words(timedate) + ' ago'
  end

  def current_admin_site_name
    site_name = Spud::Core.site_name
    if Spud::Core.multisite_mode_enabled && !session[:admin_site].blank?
      config = Spud::Core.multisite_config.select{|p| p[:site_id].to_i == session[:admin_site].to_i}
      site_name = config[0][:site_name] if !config.blank?
    end
    return site_name
  end

  def header_style
    style_str = ''
    if Spud::Core.multisite_mode_enabled
      config = Spud::Core.multisite_config.select{|p| p[:site_id].to_i == session[:admin_site].to_i}
      style_str = config[0][:header_style] if !config.blank? && config[0].has_key?(:header_style)
    end
    return style_str
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)",:class => "btn btn-danger")
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")",:class =>"btn btn-success")
  end

  def error_messages_for(object)
    content = ""
    if object.errors.any?
      content += "<div class=' alert alert-danger spud_admin_form_error_list'>"
      content += "<h4>#{pluralize(object.errors.count, "error")} prohibited you from saving:</h4>"
      content +="<ul>"
      object.errors.full_messages.each do |msg|
        content+="<li>#{msg}</li>"
      end
      content +="</ul></div>"
    end
    return content.html_safe

  end


end
