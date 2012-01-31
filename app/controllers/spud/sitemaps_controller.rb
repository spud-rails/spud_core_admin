class Spud::SitemapsController < Spud::ApplicationController
	respond_to :xml
	caches_page :show,:expires_in => 1.day
	def show
		@sitemap_urls = Spud::Core.sitemap_urls
		respond_with @sitemap_urls
	end
end
