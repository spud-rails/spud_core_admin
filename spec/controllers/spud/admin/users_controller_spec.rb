require 'spec_helper'

describe Spud::Admin::UsersController do
  before(:each) do
    activate_authlogic
    @user = SpudUserSession.create(FactoryGirl.build(:spud_user, :super_admin => true))
  end

  describe :index do
    it "should return an array of users" do
      2.times {|x| FactoryGirl.create(:spud_user) }
      get :index, :use_route => :spud_core

      assigns(:users).count.should be > 1
    end

    it "should not return any users if there are no users" do
      get :index, :use_route => :spud_core

      assigns(:users).count.should == 1 # the currently logged in user is the only user
    end

    it "should not allow access to users with NO permissions" do
      SpudUserSession.create(FactoryGirl.build(:spud_user, :super_admin => false))
      get :index, :use_route => :spud_core

      response.should redirect_to(root_url)
    end

    it "should allow access to users with the correct permissions" do
      u = FactoryGirl.create(:spud_user, :super_admin => false)
      u.spud_admin_permissions << FactoryGirl.build(:spud_admin_permission, :name => "Users", :access => true)
      SpudUserSession.create(u)
      get :index, :use_route => :spud_core

      response.should be_success
    end

    it "should not allow access to users without permission and redirect to root_url if the user has no permissions" do
      u = FactoryGirl.create(:spud_user, :super_admin => false)
      u.spud_admin_permissions << []
      SpudUserSession.create(u)
      get :index, :use_route => :spud_core

      response.should redirect_to(root_url)
    end

    it "should not allow access to users without permission and redirect to root_url if the users has no other admin modules" do
      u = FactoryGirl.create(:spud_user, :super_admin => false)
      u.spud_admin_permissions << [
        FactoryGirl.build(:spud_admin_permission, :name => "Users", :access => false)
      ]
      SpudUserSession.create(u)
      get :index, :use_route => :spud_core

      response.should redirect_to(root_url)
    end

    it "should not allow access to users without permission and redirect to admin_root if the users has other admin modules" do
      u = FactoryGirl.create(:spud_user, :super_admin => false)
      u.spud_admin_permissions << [
        FactoryGirl.build(:spud_admin_permission, :name => "Users", :access => false),
        FactoryGirl.build(:spud_admin_permission, :name => "App2", :access => true)
      ]
      SpudUserSession.create(u)
      get :index, :use_route => :spud_core

      response.should redirect_to(admin_root_url)
    end
  end

  describe :show do
    it "should respond successfully" do
      user = FactoryGirl.create(:spud_user)
      get :show, :id => user.id, :use_route => :spud_core

      response.should be_success
    end

    it "should show the user" do
      user = FactoryGirl.create(:spud_user)
      get :show, :id => user.id, :use_route => :spud_core

      assigns(:user).id.should == user.id
    end
  end

  describe :new do
    it "should respond successfully" do
      get :new, :format => :js, :use_route => :spud_core

      response.should be_success
    end

    it "should build a user object for the form" do
      get :new, :format => :js, :use_route => :spud_core

      assigns(:user).should_not be_blank
    end
  end

  describe :create do
    context "HTML format" do
      it "should create a new user with a valid form submission" do
        lambda {
          post :create, :spud_user => FactoryGirl.attributes_for(:spud_user), :use_route => :spud_core
        }.should change(SpudUser, :count).by(1)
        response.should be_redirect
      end

      it "should not create a user with an invalid form entry" do
        lambda {
          post :create, :spud_user => FactoryGirl.attributes_for(:spud_user, :email => nil), :use_route => :spud_core
        }.should_not change(SpudUser, :count)
        flash[:error].should_not be_blank
      end
    end

    context "JS format" do
      it "should create a new user with a valid form submission" do
        lambda {
          post :create, :spud_user => FactoryGirl.attributes_for(:spud_user), :format => :js, :use_route => :spud_core
        }.should change(SpudUser, :count).by(1)
        response.should be_success
      end

      it "should not create a user with an invalid form entry" do
        lambda {
          post :create, :spud_user => FactoryGirl.attributes_for(:spud_user, :email => nil), :format => :js, :use_route => :spud_core
        }.should_not change(SpudUser, :count)
        response.should_not be_success
      end

    end
  end

  describe :edit do
    context "HTML format" do
      it "should load the correct user for the edit form" do
        user = FactoryGirl.create(:spud_user)
        get :edit, :id => user.id, :use_route => :spud_core

        assigns(:user).id.should == user.id
      end
    end

    context "JS format" do
      it "should load the correct user for the edit form" do
        user = FactoryGirl.create(:spud_user)
        get :edit, :id => user.id, :format => :js, :use_route => :spud_core

        assigns(:user).id.should == user.id
      end

    end

  end

  describe :update do
    it "should update the email when the first name attribute is changed" do
      user = FactoryGirl.create(:spud_user)
      new_name = "Adam"
      lambda {
        put :update, :id => user.id, :spud_user => user.attributes.merge!(:first_name => new_name), :use_route => :spud_core
        user.reload
      }.should change(user, :first_name).to(new_name)
    end

    it "should redirect to the admin users after a successful update" do
      user = FactoryGirl.create(:spud_user)
      put :update, :id => user.id, :spud_user => user.attributes.merge!(:first_name => "Adam"), :use_route => :spud_core

      response.should redirect_to(admin_users_url)
    end
  end

  describe :destroy do
    it "should destroy the user" do
      user = FactoryGirl.create(:spud_user)
      lambda {
        delete :destroy, :id => user.id, :use_route => :spud_core
      }.should change(SpudUser, :count).by(-1)
      response.should be_redirect
    end

    it "should destroy the user with the wrong id" do
      user = FactoryGirl.create(:spud_user)
      lambda {
        delete :destroy, :id => "23532", :use_route => :spud_core
      }.should_not change(SpudUser, :count)
      response.should be_redirect
    end
  end
end
