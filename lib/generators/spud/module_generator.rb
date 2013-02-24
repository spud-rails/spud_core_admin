require 'rails/generators/migration'

class Spud::ModuleGenerator < ::Rails::Generators::Base
  desc "This generator creates a new spud module to be added to the administrative dashboard as well as a front end route"
  argument :module_name, :type => :string
  argument :attributes, :type => :array, :default => [], :banner => "field[:type][:index] field[:type][:index]"

  source_root File.expand_path('../templates', __FILE__)

  def create_module
    template "spud_admin_controller.rb.erb", "app/controllers/spud/admin/#{module_name_formatted}_controller.rb"
    template "spud_controller.rb.erb", "app/controllers/#{module_name_formatted}_controller.rb"
    invoke "model", [module_name_formatted.singularize] + attributes
    # Add views for admin
    # Add views for user front end
    # Add application.rb configuration
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
      resources :#{module_name}
    end
  end

  resources :#{module_name}, :only => [:index, :show]
EOF
  end
end
