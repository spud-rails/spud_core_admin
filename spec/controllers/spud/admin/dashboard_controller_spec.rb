require 'spec_helper'

describe Spud::Admin::DashboardController do
  before(:all) do
		Spud::Core.configure do |config|
		  config.admin_applications = [
        {name: "Blog", thumbnail: "/url/to/image", url: "/url/to/app", order: 0},
        {name: "Settings", thumbnail: "/url/to/image", url: "/url/to/app", order: 0},
        {name: "Pages", thumbnail: "/url/to/image", url: "/url/to/app", order: 0}
      ]
		end
  end

  before(:each) do
    activate_authlogic
    @user = FactoryGirl.create(:spud_user)
    SpudUserSession.create(@user)
  end

  describe :index do
    it "should display applications the current user has access to given that the current user is not a super admin" do
      @user.super_admin = false
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Blog", :access => true))
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Pages", :access => true))
      @user.save
      get :index, {:use_route => :spud_core}

      assigns(:admin_applications).collect{|app| app[:name] }.should =~ @user.spud_admin_permissions.collect{|permission| permission.name }
    end

    it "should not display applications the current user does not have access to given that the current user is not a super admin" do
      @user.super_admin = false
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Blog", :access => true))
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Pages", :access => true))
      @user.save
      get :index, {:use_route => :spud_core}

      assigns(:admin_applications).collect{|app| app[:name] }.should_not include(:settings)
    end

    it "should display all the applications despite the users permissions given the current user is a super admin" do
      @user.super_admin = true
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Blog", :access => true))
      @user.save
      get :index, {:use_route => :spud_core}

      assigns(:admin_applications).collect{|app| app[:name] }.should =~ Spud::Core.admin_applications.collect{|app| app[:name] }
    end

    it "should display applications in order of user preference if available" do
      @user.super_admin = true
      @user.save
      @user.spud_user_settings.create(:key => "app_order",:value => "Pages,Settings")
      get :index, {:use_route => :spud_core}

      assigns(:admin_applications).collect{|app| app[:name] }.should =~ ["Pages","Settings","Blog"]

    end
  end

  describe :switch do
    before(:each) do
      Spud::Core.configure do |config|
        config.site_name = "Test Site"
        config.multisite_mode_enabled = true
      end
      @user.super_admin = true
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Blog", :access => true))
      @user.save
    end

    context "when multisite select is not set" do
      it "should clear the session admin site" do
        get :switch, :multisite_select => nil, :use_route => :spud_core
        session[:admin_site].should == 0
      end

      it "should redirect to the referer" do
        get :switch, :multisite_select => nil, :use_route => :spud_core
        response.should be_redirect
      end
    end

    context "when multisite select is set" do
      context "and the selected site is configured" do
        before(:each) do
          Spud::Core.configure do |config|
            config.site_name = "Test Site"
            config.multisite_mode_enabled = true
            config.multisite_config = [{:hosts => ["test.host"], :site_name =>"Site B", :site_id => 1}]

          end
          # Spud::Core.stubs(:multisite_config).returns([{:site_id => 1}])
        end

        it "should set the session's admin site" do
          get :switch, :multisite_select => 1, :use_route => :spud_core
          session[:admin_site].should == 1

        end

        it "should redirect" do
          get :switch, :multisite_select => 1, :use_route => :spud_core
          response.should be_redirect
        end
      end

      context "and the selected site is not configured" do
        before(:each) do
          Spud::Core.configure do |config|
            config.site_name = "Test Site"
            config.multisite_mode_enabled = true
            config.multisite_config = []
          end
        end

        it "should set a flash error" do
          get :switch, :multisite_select => 1, :use_route => :spud_core
          flash[:error].should_not be_blank
        end

        it "should redirect" do
          get :switch, :multisite_select => 1, :use_route => :spud_core
          response.should be_redirect
        end
      end
    end
  end
end
