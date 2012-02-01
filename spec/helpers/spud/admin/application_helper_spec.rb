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
end