Spud Core Admin
===============

Spud Admin is a dependency package that adds a nice looking administrative panel to any project you add it to with built in authlogic authentication ready to go out of the box. It supports easy engine integration and there are several planned future engines that we plan on designing for the spud suite. The first of which is Spud CMS which can be found at http://github.com/davydotcom/spud_cms

Installation/Usage
------------------

1. In your Gemfile add the following

		gem 'spud_core', :git => "git://github.com/davydotcom/spud_core_admin.git"

2. Run bundle install
3. Copy in database migrations to your new rails project

		bundle exec rake spud_core:install:migrations
		rake db:migrate

4. run a rails server instance and point your browser to /spud/admin


Adding Your Own Engines
-----------------------

Creating a rails engine that ties into spud admin is fairly straight forward
In your new engine add spud_admin as a dependency and create an initializer inside your engine class as such:

		initializer :admin do
			Spud::Core.configure do |config|
			config.admin_applications += [{:name => "Pages",:thumbnail => "spud/admin/pages_thumb.png",:url => "/spud/admin/pages",:order => 0}]

			end
		end

You can use the layouts provided with spud admin by using 'spud/admin/application' or 'spud/admin/detail' layouts

When creating controllers for the admin panel create them in the Spud::Admin Namespace and have them extend Spud::Admin::ApplicationController for automatic user authentication restrictions.




