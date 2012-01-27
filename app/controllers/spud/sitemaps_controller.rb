class Spud::SitemapsController < Spud::ApplicationController
	caches_page :show,:expires_in => 1.day
	def show
		@sitemap_urls = Spud::Core.sitemap_urls
	end
end
