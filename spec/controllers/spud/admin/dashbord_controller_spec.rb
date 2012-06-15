require 'spec_helper'

describe Spud::Admin::DashboardController do
  before(:all) do
		Spud::Core.configure do |config|
		  config.admin_applications = [
        {name: "Blog", thumbnail: "/url/to/image", url: "/url/to/app", order: 0},
        {name: "Settings", thumbnail: "/url/to/image", url: "/url/to/app", order: 0},
        {name: "Pages", thumbnail: "/url/to/image", url: "/url/to/app", order: 0},
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
      get :index

      assigns(:admin_applications).collect{|app| app[:name] }.should =~ @user.spud_admin_permissions.collect{|permission| permission.name }
    end
    
    it "should not display applications the current user does not have access to given that the current user is not a super admin" do
      @user.super_admin = false
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Blog", :access => true))
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Pages", :access => true))
      @user.save
      get :index

      assigns(:admin_applications).collect{|app| app[:name] }.should_not include(:settings)
    end
    
    it "shoudl display all the applications despite the users permissions given the current user is a super admin" do
      @user.super_admin = true
      @user.spud_admin_permissions.build(FactoryGirl.attributes_for(:spud_admin_permission, :name => "Blog", :access => true))
      @user.save
      get :index

      assigns(:admin_applications).collect{|app| app[:name] }.should =~ Spud::Core.admin_applications.collect{|app| app[:name] }
    end
  end
end