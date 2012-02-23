
xml.instruct! :xml, :version => '1.0', :encoding => 'UTF-8'

# create the urlset
xml.sitemapindex :xmlns => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  @sitemap_urls.each do |map|
    xml.sitemap do
      xml.loc eval(map.to_s + " :format => :xml")
      xml.lastmod Time.now.utc.xmlschema
    end
  end
end