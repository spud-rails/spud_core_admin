module Spud::Admin::ApplicationHelper
  def timestamp(timedate=nil)
    return "Never" if timedate.blank?
    return Time.now() - timedate > 604800 ? timedate.strftime("%B %d") + ' at ' + timedate.strftime("%I:%M %p") : time_ago_in_words(timedate) + ' ago'
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def error_messages_for(object)
    content = ""
    if object.errors.any?
      content += "<div class='spud_admin_form_error_list'>"
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