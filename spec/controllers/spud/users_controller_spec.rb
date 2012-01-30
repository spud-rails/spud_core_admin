require 'spec_helper'

describe Spud::UsersController do
  before(:each) do
    activate_authlogic
    SpudUserSession.create(Factory.build(:spud_user))
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
    
  end
  
end