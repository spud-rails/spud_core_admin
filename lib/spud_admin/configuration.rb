module Spud
  module Core
    include ActiveSupport::Configurable

    config_accessor :site_name,:admin_applications,:s3_credentials,:paperclip_storage

    self.admin_applications = [{:name => "Users",:thumbnail => "spud/admin/users_thumb.png",:url => "/spud/admin/users",:order => 100}]
    self.paperclip_storage = :filesystem
    self.s3_credentials = "#{Rails.root}/config/s3.yml"
    self.site_name = "Company Name"
  end
end
