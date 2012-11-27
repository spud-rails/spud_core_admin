require 'spec_helper'

describe Spud::UsersController do
  before(:each) do
    activate_authlogic
    SpudUserSession.create(FactoryGirl.build(:spud_user))
  end

  describe :settings do
    it "should respond with success" do
      get :settings

      response.should be_success
    end

    it "should have a page thumbnail" do
      get :settings

      assigns(:page_thumbnail).should_not be_blank
    end

    it "should have a page name" do
      get :settings

      assigns(:page_name).should_not be_blank
    end
  end

  describe :update do
    it "should redirect to the admin root with a successful update" do
      put :update, :spud_user => {:first_name => "Mike"}
      response.should redirect_to(admin_root_url)
    end

    it "should put a message in the flash notice" do
      put :update, :spud_user => {:first_name => "Mike"}
      flash[:notice].should_not be_blank
    end

    it "should put a message in the flash error on a failed update" do
      put :update, :spud_user => {:password => "newpass"}
      flash[:error].should_not be_blank
    end

    it "should have a page thumbnail on a failed update" do
      put :update, :spud_user => {:password => "newpass"}

      assigns(:page_thumbnail).should_not be_blank
    end

    it "should have a page name on a failed update" do
      put :update, :spud_user => {:password => "newpass"}

      assigns(:page_name).should_not be_blank
    end
  end

  describe :save_setting do
    it "should fail if no params are passed" do
      get :save_setting
      response.should_not be_success
    end

    it "should save key value pair when passed" do
      get :save_setting,:key => "test",:value => "testval"
      response.should be_success
    end
  end
end
