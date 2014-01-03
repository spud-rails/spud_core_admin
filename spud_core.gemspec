$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spud_core/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spud_core"
  s.version     = Spud::Core::VERSION
  s.authors     = ["David Estes"]
  s.email       = ["destes@redwindsw.com"]
  s.homepage    = "http://github.com/davydotcom/spud_core_admin"
  s.summary     = "Spud Core Engine"
  s.description = "Spud Core Engine"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.markdown"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency 'authlogic'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'breadcrumbs_on_rails'
  s.add_dependency 'will_paginate'
  s.add_dependency 'bootstrap-will_paginate'
  s.add_dependency 'retina_tag'
  s.add_dependency 'codemirror-rails'

  s.add_dependency 'rails-observers'
  s.add_dependency 'actionpack-page_caching'
  s.add_dependency 'actionpack-action_caching'
  s.add_dependency 'protected_attributes'

  s.add_development_dependency 'mysql2'

  s.add_development_dependency 'rspec', '2.14.0'
  s.add_development_dependency 'rspec-rails', '2.14.0'
  s.add_development_dependency 'shoulda', '~> 3.0.1'
  s.add_development_dependency 'factory_girl', '~> 3.0'
  s.add_development_dependency 'database_cleaner', '1.0.0.RC1'
  s.add_development_dependency 'mocha', '0.14.0'

  s.add_development_dependency 'simplecov', '~> 0.6.4'
end
