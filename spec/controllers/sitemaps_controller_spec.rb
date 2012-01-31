require 'spec_helper'

describe Spud::SitemapsController do
  describe :show do
    it "should return the sitemap urls" do
      Spud::Core.sitemap_urls = [
        "http://www.google.com",
        "http://www.example.com"
      ]
      get :show, :format => :xml
      
      assigns(:sitemap_urls).should == Spud::Core.sitemap_urls
    end
    
    it "should only respond to an XML format" do
      get :show
      response.should be_success
    end
  end
end