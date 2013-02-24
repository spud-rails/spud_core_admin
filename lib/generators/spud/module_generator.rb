require 'rails/generators/migration'

class Spud::ModuleGenerator < ::Rails::Generators::Base
  desc "This generator creates a new spud module to be added to the administrative dashboard as well as a front end route"
  argument :module_name, :type => :string
  argument :attributes, :type => :array, :default => [], :banner => "field[:type][:index] field[:type][:index]"

  source_root File.expand_path('../templates', __FILE__)

  def create_module
    template "spud_admin_controller.rb.erb", "app/controllers/spud/admin/#{module_name_formatted}_controller.rb"
    template "spud_controller.rb.erb", "app/controllers/#{module_name_formatted}_controller.rb"
    template "views/admin/index.html.erb", "app/views/spud/admin/#{module_name_formatted}/index.html.erb"
    template "views/admin/new.html.erb", "app/views/spud/admin/#{module_name_formatted}/new.html.erb"
    template "views/admin/edit.html.erb", "app/views/spud/admin/#{module_name_formatted}/edit.html.erb"
    template "views/admin/_form.html.erb", "app/views/spud/admin/#{module_name_formatted}/_form.html.erb"
    invoke "model", [module_name_formatted.singularize] + attributes

    # Add views for user front end
    environment("Spud::Core.config.admin_applications += [{:name => '#{module_name_formatted.humanize.titlecase}',:thumbnail => \"/assets/spud/admin/portfolio.png\",:url => \"/spud/admin/#{module_name_formatted}\",:order => 96}]")
    create_routes
  end

private
  def module_name_formatted
    module_name.pluralize.downcase.underscore
  end

  def create_routes
    route <<EOF
namespace :spud do
    namespace :admin do
      resources :#{module_name_formatted}
    end
  end

  resources :#{module_name_formatted}, :only => [:index, :show]
EOF
  end
end
