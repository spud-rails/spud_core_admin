require 'spec_helper'

describe Spud::Core do

  before :each do
    Spud::Core.configure do |config|
      config.site_id = 0
      config.site_name = "Default Site"
      config.short_name = "default"
      config.multisite_mode_enabled = true
      config.multisite_config = [{:hosts => ["test.host"], :site_name =>"Site B", :short_name => 'site_b', :site_id => 1}]
    end
  end

  describe :site_config_for_id do
    it "should should return the default site config" do
      puts "testing site config for id"
      config = Spud::Core.site_config_for_id(0)
      config.should == {:site_name =>"Default Site", :short_name => 'default', :site_id => 0}
    end

    it "should return the config for Site B" do
      config = Spud::Core.site_config_for_id(1)
      config.should == {:hosts => ["test.host"], :site_name =>"Site B", :short_name => 'site_b', :site_id => 1}
    end
  end

  describe :default_site_config do
    it "should return the default site config" do 
      puts "testing default site config"
      config = Spud::Core.default_site_config
      config.should == {:site_name =>"Default Site", :short_name => 'default', :site_id => 0}
    end
  end

end