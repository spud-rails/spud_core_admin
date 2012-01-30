module Spud
   
   module Core
   	require 'spud_core/engine' if defined?(Rails)
   	require 'spud_core/configuration'
   	require 'spud_core/test_files' if ENV["RAILS_ENV"] == 'test'
   end
end
