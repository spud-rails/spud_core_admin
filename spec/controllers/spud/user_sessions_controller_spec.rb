require 'spec_helper'
describe Spud::UserSessionsController do
  before(:each) do
    # activate_authlogic
    # SpudUserSession.create(FactoryGirl.build(:spud_user))
  end

  describe :new do
  	it "should redirect to setup url if no users exist" do
  		get :new
		response.should redirect_to(spud_setup_url)   
  	end

  	it "should render login form if users do exist" do
  		u = FactoryGirl.create(:spud_user)
  		u.save
  		get :new
		response.should be_success
  	end
  end

  describe :create do
  	it "should rerender form when login is invalid" do
		post :create
	  	response.should be_success
	end
	it "should redirect to root url if login is valid" do
		u = FactoryGirl.create(:spud_user,:login => "testuser")
		u.save
		user_session = {:login => "testuser", :password => "password"}
		post :create,:spud_user_session => user_session
	  	response.should redirect_to(root_url)
	end
  end

  describe :destroy do
  	it "should redirect to login after logout" do
  		activate_authlogic
	    SpudUserSession.create(FactoryGirl.build(:spud_user))
	    delete :destroy
	    response.should redirect_to(new_spud_user_session_url)
  	end
  end


end