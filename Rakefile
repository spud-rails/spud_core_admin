begin
  require "jeweler"
    Jeweler::Tasks.new do |gem|
        gem.name = "spud_admin"
        gem.summary = "Spud Admin Panel Engine"
        gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
	gem.platform = Gem::Platform::RUBY
	gem.add_dependency "activesupport" , ">= 3.1.3"
  	gem.add_dependency "rails"         , ">= 3.1.3"
        gem.add_dependency 'authlogic'
        gem.add_dependency 'jquery-rails'
        gem.add_dependency 'dynamic_form'
        gem.add_dependency 'breadcrumbs_on_rails'
        gem.add_dependency 'will_paginate'
	gem.authors = "David Estes"
	gem.homepage = "http://github.com/davydotcom/spud_core_admin"
	gem.email = "destes@redwindsw.com"
        # other fields that would normally go in your gemspec
        # like authors, email and has_rdoc can also be included here
	end
rescue
	puts "Jeweler or one of its dependencies is not installed."
end

