require 'spec_helper'

describe SpudUser do
  it { should have_many(:spud_admin_permissions) }

  describe ".full_name" do
    it "should return the full name if the first and last name are not blank" do
      u = Factory.build(:spud_user)
      u.full_name.should == "#{u.first_name} #{u.last_name}"
    end
  
    it "should return only the last name if the first name is blank" do
      u = Factory.build(:spud_user, :first_name => nil)
      u.full_name.should == u.last_name
    end
  
    it "should return only the first name if the last name is blank" do
      u = Factory.build(:spud_user, :last_name => nil)
      u.full_name.should == u.first_name
    end
  
    it "should return the login if the first and last name are blank" do
      u = Factory.build(:spud_user, :first_name => nil, :last_name => nil)
      u.full_name.should == u.login
    end
  end
end