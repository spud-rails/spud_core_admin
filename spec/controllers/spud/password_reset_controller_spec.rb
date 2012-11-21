require 'spec_helper'

describe Spud::PasswordResetsController do
  let(:user) { FactoryGirl.build(:spud_user, :id => 1) }

  context :get do
    describe :new do
      it "should return success" do
        get :new
        response.should be_success
      end
    end

    describe :edit do
      context "with a valid id" do
        before(:all) do
          SpudUser.stubs(:find_using_perishable_token).returns(user)
        end

        it "should render the edit form" do
          get :edit, :id => 1
          response.should be_success
        end
      end

      context "with an invalid id" do
        before(:all) do
          SpudUser.stubs(:find_using_perishable_token).returns(nil)
        end

        it "should redirect to the login form" do
          get :edit, :id => user.id
          response.should redirect_to(spud_core.new_user_session_url)
        end
      end
    end
  end

  context :post do

    describe :create do
      context "with a valid user email address submitted" do
        before(:each) do
          user.perishable_token = "jfdlsafhbkvabuadfbds"
          SpudUser.stubs(:find_by_email).returns(user)
        end

        it "should trigger the password notificiation" do
          Spud::CoreMailer.expects(:forgot_password_notification).returns(stub(:deliver))
          post :create, :email => user.email
        end

        it "should redirect to the login form" do
          post :create, :email => user.email
          response.should redirect_to(spud_core.new_user_session_url)
        end
      end

      context "with an invalid user email address submitted" do
        before(:each) do
          SpudUser.stubs(:find_by_email).returns(nil)
        end
        it "should re-render the password reset form" do
          post :create, :email => "invalid@email.com"
          response.should render_template("new")
        end
      end
    end

    describe :update do
      let(:valid_data) { {:id => user.id, :spud_user => {:password => "password", :password_confirmation => "password"}}}
      let(:invalid_data) { {:id => user.id, :spud_user => {:password => "password", :password_confirmation => "drowssap"}}}

      before(:each) do
        SpudUser.stubs(:find_using_perishable_token).returns(user)
      end

      context "with valid password entry" do
        it "should save and redirect to the login form" do
          post :update, valid_data
          response.should redirect_to(spud_core.new_user_session_url)
        end
      end

      context "with an invalid password entry" do
        it "should re-render the password form" do
          post :update, invalid_data
          response.should render_template("edit")
        end
      end
    end
  end
end
