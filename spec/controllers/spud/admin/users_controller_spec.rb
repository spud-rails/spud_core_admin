require 'spec_helper'

describe Spud::Admin::UsersController do
  before(:each) do
    activate_authlogic
    SpudUserSession.create(Factory.build(:spud_user, :super_admin => true))
  end
  
  describe :index do
    it "should return an array of users" do
      2.times {|x| Factory(:spud_user) }
      get :index
      
      assigns(:users).count.should be > 1
    end
    
    it "should not return any users if there are no users" do
      get :index
      
      assigns(:users).count.should == 1 # the currently logged in user is the only user
    end
    it "should not allow access to users with NO permissions" do
      SpudUserSession.create(Factory.build(:spud_user, :super_admin => false))
      get :index
      response.should redirect_to(root_url)   
    end
    it "should allow access to users with the correct permissions" do
      u = Factory.build(:spud_user, :super_admin => false)
      u.save
      u.spud_admin_permissions << Factory.build(:spud_admin_permission, :name => "Users",:access => true)
      SpudUserSession.create()
      get :index
      response.should be_success
    end
    it "should not allow access to users without permission" do
      u = Factory.build(:spud_user, :super_admin => false)
      u.save
      u.spud_admin_permissions << Factory.build(:spud_admin_permission, :name => "Users",:access => false)
      SpudUserSession.create()
      get :index
      response.should be_success
    end
  end
  
  describe :show do
    it "should respond successfully" do
      user = Factory(:spud_user)
      get :show, :id => user.id
      
      response.should be_success
    end
    
    it "should show the user" do
      user = Factory(:spud_user)
      get :show, :id => user.id
      
      assigns(:user).id.should == user.id
    end
  end
  
  describe :new do
    it "should respond successfully" do
      get :new, :format => :js
      
      response.should be_success
    end
    
    it "should build a user object for the form" do
      get :new, :format => :js
      
      assigns(:user).should_not be_blank
    end
  end
  
  describe :create do
    context "HTML format" do
      it "should create a new user with a valid form submission" do
        lambda {
          post :create, :spud_user => Factory.attributes_for(:spud_user)
        }.should change(SpudUser, :count).by(1)
        response.should be_redirect
      end
    
      it "should not create a user with an invalid form entry" do
        lambda {
          post :create, :spud_user => Factory.attributes_for(:spud_user, :email => nil)
        }.should_not change(SpudUser, :count)
        flash[:error].should_not be_blank
      end
    end
    
    context "JS format" do
      it "should create a new user with a valid form submission" do
        lambda {
          post :create, :spud_user => Factory.attributes_for(:spud_user), :format => :js
        }.should change(SpudUser, :count).by(1)
        response.should be_success
      end
    
      it "should not create a user with an invalid form entry" do
        lambda {
          post :create, :spud_user => Factory.attributes_for(:spud_user, :email => nil), :format => :js
        }.should_not change(SpudUser, :count)
        response.should_not be_success
      end
      
    end
  end
  
  describe :edit do
    context "HTML format" do
      it "should load the correct user for the edit form" do
        user = Factory(:spud_user)
        get :edit, :id => user.id
      
        assigns(:user).id.should == user.id
      end
    end

    context "JS format" do
      it "should load the correct user for the edit form" do
        user = Factory(:spud_user)
        get :edit, :id => user.id, :format => :js
      
        assigns(:user).id.should == user.id
      end
      
    end

  end
  
  describe :update do
    it "should update the email when the first name attribute is changed" do
      user = Factory(:spud_user)
      new_name = "Adam"
      lambda {
        put :update, :id => user.id, :spud_user => user.attributes.merge!(:first_name => new_name)
        user.reload
      }.should change(user, :first_name).to(new_name)
    end
    
    it "should redirect to the admin users after a successful update" do
      user = Factory(:spud_user)
      put :update, :id => user.id, :spud_user => user.attributes.merge!(:first_name => "Adam")
      
      response.should redirect_to(spud_admin_users_url)
    end
  end
  
  describe :destroy do
    it "should destroy the user" do
      user = Factory(:spud_user)
      lambda {
        delete :destroy, :id => user.id
      }.should change(SpudUser, :count).by(-1)
      response.should be_redirect
    end
    
    it "should destroy the user with the wrong id" do
      user = Factory(:spud_user)
      lambda {
        delete :destroy, :id => "23532"
      }.should_not change(SpudUser, :count)
      response.should be_redirect
    end
  end
end