require 'spec_helper'

describe Spud::Admin::ApplicationController do
  class TestController < Spud::Admin::ApplicationController
    def index
      render :nothing => true
    end
  end
  
  before :each do
    @controller = TestController.new
    activate_authlogic
    @user = Factory(:spud_user)
    @session = SpudUserSession.create(@user)
  end
  
  describe :require_admin_user do
    it "should respond successfully if the current user is a super admin" do
      @user.update_attribute(:super_admin, true)
      get :index
      
      response.should be_success
    end
    
    it "should respond successfully if the current user has admin permissions" do
      @user.spud_admin_permissions.create(:name => "pages", :access => true)
      get :index
      
      response.should be_success
    end
    
    it "should redirect to the login if the current user is not logged in" do
      @session.destroy
      get :index
      
      response.should redirect_to(new_spud_user_session_url)
    end
    
    it "should redirect to the root for a user without administrative priviledges" do
      @user.super_admin = false
      @user.spud_admin_permissions = []
      @user.save
      get :index
      
      response.should redirect_to(root_url)
    end
    
  end
end