module Spud
   
   module Core
   	require 'spud_admin/engine' if defined?(Rails)
   	require 'spud_admin/configuration'
   	require 'spud_admin/test_files' if ENV["RAILS_ENV"] == 'test'
   end
end
