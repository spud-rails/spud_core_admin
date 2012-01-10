# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "spud_admin"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Estes"]
  s.date = "2012-01-10"
  s.email = "destes@redwindsw.com"
  s.files = [
    "app/assets/images/Sorting icons.psd",
    "app/assets/images/back_disabled.jpg",
    "app/assets/images/back_enabled.jpg",
    "app/assets/images/favicon.ico",
    "app/assets/images/forward_disabled.jpg",
    "app/assets/images/forward_enabled.jpg",
    "app/assets/images/sort_asc.png",
    "app/assets/images/sort_asc_disabled.png",
    "app/assets/images/sort_both.png",
    "app/assets/images/sort_desc.png",
    "app/assets/images/sort_desc_disabled.png",
    "app/assets/images/spud/admin/flick/ui-bg_flat_0_aaaaaa_40x100.png",
    "app/assets/images/spud/admin/flick/ui-bg_flat_0_eeeeee_40x100.png",
    "app/assets/images/spud/admin/flick/ui-bg_flat_55_ffffff_40x100.png",
    "app/assets/images/spud/admin/flick/ui-bg_flat_75_ffffff_40x100.png",
    "app/assets/images/spud/admin/flick/ui-bg_glass_65_ffffff_1x400.png",
    "app/assets/images/spud/admin/flick/ui-bg_highlight-soft_100_f6f6f6_1x100.png",
    "app/assets/images/spud/admin/flick/ui-bg_highlight-soft_25_0073ea_1x100.png",
    "app/assets/images/spud/admin/flick/ui-bg_highlight-soft_50_dddddd_1x100.png",
    "app/assets/images/spud/admin/flick/ui-icons_0073ea_256x240.png",
    "app/assets/images/spud/admin/flick/ui-icons_454545_256x240.png",
    "app/assets/images/spud/admin/flick/ui-icons_666666_256x240.png",
    "app/assets/images/spud/admin/flick/ui-icons_ff0084_256x240.png",
    "app/assets/images/spud/admin/flick/ui-icons_ffffff_256x240.png",
    "app/assets/images/spud/admin/humanity/ui-bg_flat_75_aaaaaa_40x100.png",
    "app/assets/images/spud/admin/humanity/ui-bg_glass_100_f5f0e5_1x400.png",
    "app/assets/images/spud/admin/humanity/ui-bg_glass_25_cb842e_1x400.png",
    "app/assets/images/spud/admin/humanity/ui-bg_glass_70_ede4d4_1x400.png",
    "app/assets/images/spud/admin/humanity/ui-bg_highlight-hard_100_f4f0ec_1x100.png",
    "app/assets/images/spud/admin/humanity/ui-bg_highlight-hard_65_fee4bd_1x100.png",
    "app/assets/images/spud/admin/humanity/ui-bg_highlight-hard_75_f5f5b5_1x100.png",
    "app/assets/images/spud/admin/humanity/ui-bg_inset-soft_100_f4f0ec_1x100.png",
    "app/assets/images/spud/admin/humanity/ui-icons_c47a23_256x240.png",
    "app/assets/images/spud/admin/humanity/ui-icons_cb672b_256x240.png",
    "app/assets/images/spud/admin/humanity/ui-icons_f08000_256x240.png",
    "app/assets/images/spud/admin/humanity/ui-icons_f35f07_256x240.png",
    "app/assets/images/spud/admin/humanity/ui-icons_ff7519_256x240.png",
    "app/assets/images/spud/admin/humanity/ui-icons_ffffff_256x240.png",
    "app/assets/images/spud/admin/users_thumb.png",
    "app/assets/javascripts/spud/admin/application.js",
    "app/assets/javascripts/spud/admin/jquery.dataTables.min.js",
    "app/assets/javascripts/spud/admin/users.js",
    "app/assets/javascripts/spud/setup.js",
    "app/assets/javascripts/spud/user_sessions.js",
    "app/assets/stylesheets/spud/admin/application.css",
    "app/assets/stylesheets/spud/admin/jquery-ui.css",
    "app/assets/stylesheets/spud/admin/users.css",
    "app/assets/stylesheets/spud/login.css",
    "app/assets/stylesheets/spud/setup.css",
    "app/assets/stylesheets/spud/user_sessions.css",
    "app/controllers/spud/admin/application_controller.rb",
    "app/controllers/spud/admin/dashboard_controller.rb",
    "app/controllers/spud/admin/users_controller.rb",
    "app/controllers/spud/application_controller.rb",
    "app/controllers/spud/setup_controller.rb",
    "app/controllers/spud/user_sessions_controller.rb",
    "app/helpers/spud/admin/application_helper.rb",
    "app/helpers/spud/admin/users_helper.rb",
    "app/helpers/spud/setup_helper.rb",
    "app/helpers/spud/user_sessions_helper.rb",
    "app/models/spud_admin_permission.rb",
    "app/models/spud_user.rb",
    "app/models/spud_user_session.rb",
    "app/views/layouts/spud/admin/application.html.erb",
    "app/views/layouts/spud/admin/detail.html.erb",
    "app/views/layouts/spud/login.html.erb",
    "app/views/layouts/spud/setup.html.erb",
    "app/views/spud/admin/dashboard/index.html.erb",
    "app/views/spud/admin/users/_edit.html.erb",
    "app/views/spud/admin/users/_form.html.erb",
    "app/views/spud/admin/users/_new.html.erb",
    "app/views/spud/admin/users/index.html.erb",
    "app/views/spud/admin/users/show.html.erb",
    "app/views/spud/setup/index.html.erb",
    "app/views/spud/user_sessions/new.html.erb",
    "config/application.rb",
    "config/boot.rb",
    "config/routes.rb",
    "lib/spud_admin.rb",
    "lib/spud_admin/engine.rb"
  ]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "Spud Admin Panel Engine"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<authlogic>, [">= 0"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<dynamic_form>, [">= 0"])
      s.add_runtime_dependency(%q<breadcrumbs_on_rails>, [">= 0"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 0"])
    else
      s.add_dependency(%q<authlogic>, [">= 0"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<dynamic_form>, [">= 0"])
      s.add_dependency(%q<breadcrumbs_on_rails>, [">= 0"])
      s.add_dependency(%q<will_paginate>, [">= 0"])
    end
  else
    s.add_dependency(%q<authlogic>, [">= 0"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<dynamic_form>, [">= 0"])
    s.add_dependency(%q<breadcrumbs_on_rails>, [">= 0"])
    s.add_dependency(%q<will_paginate>, [">= 0"])
  end
end

