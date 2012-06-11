require 'spec_helper'

describe Spud::Admin::ApplicationHelper do
  describe :timestamp do
    it "should return 'Never' if a timedate is not given" do
      timestamp.should == 'Never'
    end
    
    it "should reutrn 'x ago' when the supplied timestamp is less than a week ago" do
      timestamp(6.days.ago).should match('.*? ago')
    end
    
    it "should not return 'x at x' when the timestamp is less than a week ago" do
      timestamp(5.minutes.ago).should_not match(/.*? at .*/)
    end
    
    it "should return 'x at x' when the timestamp is more than a week ago" do
      timestamp(7.days.ago).should match(/.*? at .*/)
    end
    
    it "should not reutrn 'x ago' when the supplied timestamp is more than a week ago" do
      timestamp(8.days.ago).should_not match('.*? ago')
    end
    
  end
  describe :current_site_name do
    it "should return config site name if multisite is disabled" do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
      end
      current_site_name.should == 'Test Site'
    end

    it "should return config site name if multisite is enabled but multisite name is blank" do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
        config.multisite_enabled = true
      end
      current_site_name.should == 'Test Site'
    end

    it "should return multisite name if multisite is enabled" do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
        config.multisite_enabled = true
        config.multisite_config += [{:host => "example.com",:site_name =>"Site B"}]
      end
      helper.request = {:host_with_port => "example.com"}
      
      current_site_name.should == 'Site B'
    end
    
  end

end