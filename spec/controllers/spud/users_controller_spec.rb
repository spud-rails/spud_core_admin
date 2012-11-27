require 'spec_helper'

describe Spud::UsersController do
  before(:each) do
    activate_authlogic
    SpudUserSession.create(FactoryGirl.build(:spud_user))
  end

  describe :settings do
    it "should respond with success" do
      get :settings, :use_route => :spud_core

      response.should be_success
    end

    it "should have a page thumbnail" do
      get :settings, :use_route => :spud_core

      assigns(:page_thumbnail).should_not be_blank
    end

    it "should have a page name" do
      get :settings, :use_route => :spud_core

      assigns(:page_name).should_not be_blank
    end
  end

  describe :update do
    it "should redirect to the admin root with a successful update" do
      put :update, :spud_user => {:first_name => "Mike"}, :use_route => :spud_core
      response.should redirect_to(admin_root_url)
    end

    it "should put a message in the flash notice" do
      put :update, :spud_user => {:first_name => "Mike"}, :use_route => :spud_core
      flash[:notice].should_not be_blank
    end

    it "should put a message in the flash error on a failed update" do
      put :update, :spud_user => {:password => "newpass"}, :use_route => :spud_core
      flash[:error].should_not be_blank
    end

    it "should have a page thumbnail on a failed update" do
      put :update, :spud_user => {:password => "newpass"}, :use_route => :spud_core

      assigns(:page_thumbnail).should_not be_blank
    end

    it "should have a page name on a failed update" do
      put :update, :spud_user => {:password => "newpass"}, :use_route => :spud_core

      assigns(:page_name).should_not be_blank
    end
  end

  describe :save_setting do
    it "should fail if no params are passed" do
      get :save_setting, :use_route => :spud_core
      response.should_not be_success
    end

    it "should save key value pair when passed" do
      get :save_setting,:key => "test",:value => "testval", :use_route => :spud_core
      response.should be_success
    end
  end
end
