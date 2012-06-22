require 'spec_helper'

describe Spud::Admin::ApplicationHelper do
  describe :timestamp do
    it "should return 'Never' if a timedate is not given" do
      timestamp.should == 'Never'
    end

    it "should reutrn 'x ago' when the supplied timestamp is less than a week ago" do
      timestamp(6.days.ago).should match('.*? ago')
    end

    it "should not return 'x at x' when the timestamp is less than a week ago" do
      timestamp(5.minutes.ago).should_not match(/.*? at .*/)
    end

    it "should return 'x at x' when the timestamp is more than a week ago" do
      timestamp(7.days.ago).should match(/.*? at .*/)
    end

    it "should not reutrn 'x ago' when the supplied timestamp is more than a week ago" do
      timestamp(8.days.ago).should_not match('.*? ago')
    end

  end

  describe :current_admin_site_name do
    let(:core_site_name) { "Spud" }
    let(:multi_site_name) { "Spud2" }
    before(:each) do
      Spud::Core.stubs(:site_name).returns(core_site_name)
    end

    context "with multisite mode enabled" do
      before(:each) do
        Spud::Core.stubs(:multisite_mode_enabled).returns(true)
      end

      context "with a site selected" do
        before(:each) do
          controller.stubs(:session).returns({:admin_site => 1})
        end

        it "should return the spud core site name if the selected site's name is not configured" do
          Spud::Core.stubs(:multisite_config).returns([{:site_id => 2, :site_name => multi_site_name}])
          helper.current_admin_site_name.should == core_site_name
        end

        it "should return the selected site name if the select site's name is configured" do
          Spud::Core.stubs(:multisite_config).returns([{:site_id => 1, :site_name => multi_site_name}])
          helper.current_admin_site_name.should == multi_site_name
        end
      end

      context "without a site selected" do
        before(:each) do
          controller.stubs(:session).returns({:admin_site => nil})
        end

        it "should return the core's site name" do
          helper.current_admin_site_name.should == core_site_name
        end
      end
    end

    context "with multisite mode disabled" do
      before(:each) do
        Spud::Core.stubs(:multisite_mode_enabled).returns(false)
      end

      it "should return the core's site name" do
        helper.current_admin_site_name.should == core_site_name
      end
    end
  end

  describe :header_style do
    let(:style_string) { 'Big' }

    context "with multisite mode enabled" do
      before(:each) do
        Spud::Core.stubs(:multisite_mode_enabled).returns(true)
      end

      context "and an admin site is selected" do
        before(:each) do
          controller.stubs(:session).returns({:admin_site => 1})
        end

        it "should return a style string if the site is configured" do
          Spud::Core.stubs(:multisite_config).returns([{:site_id => 1, :header_style => style_string}])
          helper.header_style.should == style_string
        end

        it "should return an empty string if the site is not configured" do
           Spud::Core.stubs(:multisite_config).returns([])
           helper.header_style.should == ''
        end
      end

      context "and an admin site is not selected" do
        before(:each) do
          controller.stubs(:session).returns({:admin_site => nil})
        end

        it "should return an empty string" do
          helper.header_style.should == ''
        end
      end
    end

    context "with multisite mode disabled" do
      before(:each) do
        Spud::Core.stubs(:multisite_mode_enabled).returns(false)
      end

      it "should return an empty string" do
        helper.header_style.should == ''
      end
    end
  end

  describe :error_messages_for do
    before(:each) do
      @user = FactoryGirl.create(:spud_user)
    end

    it "should return blank when no errors exist" do
      helper.error_messages_for(@user).should == ''
    end

    it "should display 1 error when the subject has 2 errors" do
      @user.errors[:base] << "error 1"
      helper.error_messages_for(@user).should include("1 error")
    end

    (1..3).each do |error_count|
      it "should display #{error_count} errors when the subject has #{error_count} errors" do
        error_count.times {|x| @user.errors[:base] << "error #{x}" }
        helper.error_messages_for(@user).should include("#{@user.errors[:base].size} error")
      end
    end

    it "should display the error" do
      error = "You're invalid"
      @user.errors[:base] << error
      helper.error_messages_for(@user).should include(error)
    end
  end
end
