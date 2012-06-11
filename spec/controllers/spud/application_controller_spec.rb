require 'spec_helper'

describe Spud::ApplicationController do
  class TestSpudController < Spud::ApplicationController
    def index
      render :nothing => true
    end
  end
  
  before :each do
    @controller = TestSpudController.new
    activate_authlogic
    @user = Factory(:spud_user)
    @session = SpudUserSession.create(@user)
  end
  


    describe :current_site_name do
    it "should return config site name if multisite is disabled" do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
      end
      @controller.current_site_name.should == 'Test Site'
    end

    it "should return config site name if multisite is enabled but multisite name is blank" do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
        config.multisite_enabled = true
      end
      @controller.current_site_name.should == 'Test Site'
    end

    # it "should return multisite name if multisite is enabled" do
    #   Spud::Core.configure do |config|
    #     config.site_name = "Test Site"
    #     config.multisite_enabled = true
    #     config.multisite_config += [{:host => "example.com",:site_name =>"Site B"}]
    #   end
    #   # helper.request = {:host_with_port => "example.com"}
      
    #   @controller.current_site_name.should == 'Site B'
    # end
    
  end
end