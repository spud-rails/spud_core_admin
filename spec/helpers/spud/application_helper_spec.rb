require 'spec_helper'

describe Spud::ApplicationHelper do
    before :each do
    activate_authlogic
    @user = FactoryGirl.create(:spud_user)
    @session = SpudUserSession.create(@user)
  end

  describe :current_site_name do

    it "should return config site name if multisite is disabled" do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
      end
      helper.current_site_name.should == 'Test Site'
    end

    it "should return config site name if multisite is enabled but multisite name is blank" do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
        config.multisite_mode_enabled = true
      end

      helper.current_site_name.should == 'Test Site'
    end

    it "should return multisite name if multisite is enabled" do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
        config.multisite_mode_enabled = true
        config.multisite_config += [{:hosts => ["test.host"], :site_name =>"Site B", :site_id => 1}]
      end

      helper.current_site_name.should == 'Site B'
    end
  end

  describe :current_site_id do



    it "should return the default site id if multisite is disabled" do
      Spud::Core.configure do |config|
        config.site_id = 0
        config.multisite_mode_enabled = false
        config.multisite_config = []
      end
      helper.current_site_id.should == 0
    end

    it "should return the current site id if multisite is enabled" do
      Spud::Core.configure do |config|
        config.multisite_mode_enabled = true
        config.multisite_config = [{:hosts => ["test.host"], :site_name =>"Site B", :site_id => 1}]
      end
      # @controller.request = request
      helper.current_site_id.should == 1
    end

  end
end
