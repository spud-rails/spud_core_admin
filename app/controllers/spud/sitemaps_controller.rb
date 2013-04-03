class Spud::SitemapsController < Spud::ApplicationController
	respond_to :xml

	def show
		@sitemap_urls = Spud::Core.sitemap_urls
		respond_with @sitemap_urls
	end
end
