require 'spec_helper'

describe Spud::SetupController do
  
  describe :index do
    it "should be successful" do
      get :index
      
      response.should be_success
    end
    
    it "should have a page thumbnail" do
      get :index
      
      assigns(:page_thumbnail).should_not be_blank
    end
    
    it "should have a page name" do
      get :index
      
      assigns(:page_name).should_not be_blank
    end
    
    it "should set a flash error message when a spud user exists" do
      SpudUser.stubs(:count).returns(1)
      get :index
      
      flash[:error].should_not be_blank
    end
    
    it "should redirect to the admin login form when there is already a user" do
      SpudUser.stubs(:count).returns(1)
      get :index
      
      response.should redirect_to(new_spud_user_session_url)
    end
    
    it "should create a new user" do
      lambda {
        post :index, FactoryGirl.attributes_for(:spud_user)
      }.should change(SpudUser, :count).by(1)
    end
    
    it "should redirect to the admin login form when first admin user has been created" do
      post :index, FactoryGirl.attributes_for(:spud_user)
      
      response.should redirect_to(new_spud_user_session_url)
    end
    
    it "should display an error if the user is invalid" do
      post :index, FactoryGirl.attributes_for(:spud_user, :email => nil)
      
      flash[:error].should_not be_blank
    end
  end
end