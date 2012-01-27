# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "spud_admin"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Estes"]
  s.date = "2012-01-27"
  s.email = "destes@redwindsw.com"
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
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
    "app/assets/images/spud/admin/users_thumb.png",
    "app/assets/javascripts/spud/admin/application.js",
    "app/assets/javascripts/spud/admin/jquery.dataTables.min.js",
    "app/assets/javascripts/spud/admin/settings.js",
    "app/assets/javascripts/spud/admin/users.js",
    "app/assets/javascripts/spud/setup.js",
    "app/assets/javascripts/spud/user_sessions.js",
    "app/assets/javascripts/spud/users.js",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-blockquote.png",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-h1.png",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-h2.png",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-h3.png",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-h4.png",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-h5.png",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-h6.png",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-p.png",
    "app/assets/javascripts/wymeditor/iframe/default/lbl-pre.png",
    "app/assets/javascripts/wymeditor/iframe/default/wymiframe.css",
    "app/assets/javascripts/wymeditor/iframe/default/wymiframe.html",
    "app/assets/javascripts/wymeditor/jquery.wymeditor.pack.js",
    "app/assets/javascripts/wymeditor/lang/bg.js",
    "app/assets/javascripts/wymeditor/lang/ca.js",
    "app/assets/javascripts/wymeditor/lang/cs.js",
    "app/assets/javascripts/wymeditor/lang/cy.js",
    "app/assets/javascripts/wymeditor/lang/de.js",
    "app/assets/javascripts/wymeditor/lang/en.js",
    "app/assets/javascripts/wymeditor/lang/es.js",
    "app/assets/javascripts/wymeditor/lang/fa.js",
    "app/assets/javascripts/wymeditor/lang/fi.js",
    "app/assets/javascripts/wymeditor/lang/fr.js",
    "app/assets/javascripts/wymeditor/lang/gl.js",
    "app/assets/javascripts/wymeditor/lang/he.js",
    "app/assets/javascripts/wymeditor/lang/hr.js",
    "app/assets/javascripts/wymeditor/lang/hu.js",
    "app/assets/javascripts/wymeditor/lang/it.js",
    "app/assets/javascripts/wymeditor/lang/nb.js",
    "app/assets/javascripts/wymeditor/lang/nl.js",
    "app/assets/javascripts/wymeditor/lang/nn.js",
    "app/assets/javascripts/wymeditor/lang/pl.js",
    "app/assets/javascripts/wymeditor/lang/pt-br.js",
    "app/assets/javascripts/wymeditor/lang/pt.js",
    "app/assets/javascripts/wymeditor/lang/ru.js",
    "app/assets/javascripts/wymeditor/lang/sv.js",
    "app/assets/javascripts/wymeditor/lang/tr.js",
    "app/assets/javascripts/wymeditor/lang/zh_cn.js",
    "app/assets/javascripts/wymeditor/plugins/embed/jquery.wymeditor.embed.js",
    "app/assets/javascripts/wymeditor/plugins/fullscreen/icon_fullscreen.gif",
    "app/assets/javascripts/wymeditor/plugins/fullscreen/jquery.wymeditor.fullscreen.js",
    "app/assets/javascripts/wymeditor/plugins/hovertools/jquery.wymeditor.hovertools.js",
    "app/assets/javascripts/wymeditor/plugins/resizable/jquery.wymeditor.resizable.js",
    "app/assets/javascripts/wymeditor/plugins/resizable/readme.txt",
    "app/assets/javascripts/wymeditor/plugins/tidy/README",
    "app/assets/javascripts/wymeditor/plugins/tidy/jquery.wymeditor.tidy.js",
    "app/assets/javascripts/wymeditor/plugins/tidy/tidy.php",
    "app/assets/javascripts/wymeditor/plugins/tidy/wand.png",
    "app/assets/javascripts/wymeditor/skins/compact/icons.png",
    "app/assets/javascripts/wymeditor/skins/compact/skin.css",
    "app/assets/javascripts/wymeditor/skins/compact/skin.js",
    "app/assets/javascripts/wymeditor/skins/default/icons.png",
    "app/assets/javascripts/wymeditor/skins/default/skin.css",
    "app/assets/javascripts/wymeditor/skins/default/skin.js",
    "app/assets/javascripts/wymeditor/skins/minimal/images/bg.header.gif",
    "app/assets/javascripts/wymeditor/skins/minimal/images/bg.selector.silver.gif",
    "app/assets/javascripts/wymeditor/skins/minimal/images/bg.wymeditor.png",
    "app/assets/javascripts/wymeditor/skins/minimal/images/icons.silver.gif",
    "app/assets/javascripts/wymeditor/skins/minimal/skin.css",
    "app/assets/javascripts/wymeditor/skins/minimal/skin.js",
    "app/assets/javascripts/wymeditor/skins/silver/COPYING",
    "app/assets/javascripts/wymeditor/skins/silver/README",
    "app/assets/javascripts/wymeditor/skins/silver/images/bg.header.gif",
    "app/assets/javascripts/wymeditor/skins/silver/images/bg.selector.silver.gif",
    "app/assets/javascripts/wymeditor/skins/silver/images/bg.wymeditor.png",
    "app/assets/javascripts/wymeditor/skins/silver/images/icons.silver.gif",
    "app/assets/javascripts/wymeditor/skins/silver/skin.css",
    "app/assets/javascripts/wymeditor/skins/silver/skin.js",
    "app/assets/javascripts/wymeditor/skins/twopanels/icons.png",
    "app/assets/javascripts/wymeditor/skins/twopanels/skin.css",
    "app/assets/javascripts/wymeditor/skins/twopanels/skin.js",
    "app/assets/javascripts/wymeditor/skins/wymeditor_icon.png",
    "app/assets/stylesheets/spud/admin/application.css",
    "app/assets/stylesheets/spud/admin/jquery-ui.css",
    "app/assets/stylesheets/spud/admin/settings.css",
    "app/assets/stylesheets/spud/admin/users.css",
    "app/assets/stylesheets/spud/forms.css",
    "app/assets/stylesheets/spud/login.css",
    "app/assets/stylesheets/spud/login/application.css",
    "app/assets/stylesheets/spud/setup.css",
    "app/assets/stylesheets/spud/user_sessions.css",
    "app/assets/stylesheets/spud/users.css",
    "app/controllers/spud/admin/application_controller.rb",
    "app/controllers/spud/admin/dashboard_controller.rb",
    "app/controllers/spud/admin/settings_controller.rb",
    "app/controllers/spud/admin/users_controller.rb",
    "app/controllers/spud/application_controller.rb",
    "app/controllers/spud/setup_controller.rb",
    "app/controllers/spud/user_sessions_controller.rb",
    "app/controllers/spud/users_controller.rb",
    "app/helpers/spud/admin/application_helper.rb",
    "app/helpers/spud/admin/settings_helper.rb",
    "app/helpers/spud/admin/users_helper.rb",
    "app/helpers/spud/setup_helper.rb",
    "app/helpers/spud/user_sessions_helper.rb",
    "app/helpers/spud/users_helper.rb",
    "app/models/spud_admin_permission.rb",
    "app/models/spud_setting.rb",
    "app/models/spud_user.rb",
    "app/models/spud_user_session.rb",
    "app/views/layouts/spud/admin/application.html.erb",
    "app/views/layouts/spud/admin/detail.html.erb",
    "app/views/layouts/spud/login/application.html.erb",
    "app/views/layouts/spud/setup.html.erb",
    "app/views/spud/admin/dashboard/index.html.erb",
    "app/views/spud/admin/users/_edit.html.erb",
    "app/views/spud/admin/users/_form.html.erb",
    "app/views/spud/admin/users/_new.html.erb",
    "app/views/spud/admin/users/index.html.erb",
    "app/views/spud/admin/users/show.html.erb",
    "app/views/spud/setup/index.html.erb",
    "app/views/spud/user_sessions/new.html.erb",
    "app/views/spud/users/_form.html.erb",
    "app/views/spud/users/settings.html.erb",
    "config/application.rb",
    "config/boot.rb",
    "config/routes.rb",
    "lib/spud_admin.rb",
    "lib/spud_admin/belongs_to_app.rb",
    "lib/spud_admin/configuration.rb",
    "lib/spud_admin/engine.rb"
  ]
  s.homepage = "http://github.com/davydotcom/spud_core_admin"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Spud Admin Panel Engine"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 3.1.3"])
      s.add_runtime_dependency(%q<rails>, [">= 3.1.3"])
      s.add_runtime_dependency(%q<authlogic>, [">= 0"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<dynamic_form>, [">= 0"])
      s.add_runtime_dependency(%q<breadcrumbs_on_rails>, [">= 0"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 3.1.3"])
      s.add_dependency(%q<rails>, [">= 3.1.3"])
      s.add_dependency(%q<authlogic>, [">= 0"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<dynamic_form>, [">= 0"])
      s.add_dependency(%q<breadcrumbs_on_rails>, [">= 0"])
      s.add_dependency(%q<will_paginate>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 3.1.3"])
    s.add_dependency(%q<rails>, [">= 3.1.3"])
    s.add_dependency(%q<authlogic>, [">= 0"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<dynamic_form>, [">= 0"])
    s.add_dependency(%q<breadcrumbs_on_rails>, [">= 0"])
    s.add_dependency(%q<will_paginate>, [">= 0"])
  end
end

