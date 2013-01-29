class Unirole::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)

  def inject_gem_dependeny
    gem 'slim'
    gem 'simple_form'
    gem 'cancan'
    gem 'mongoid'
    gem 'bson_ext'
    gem 'will_paginate_mongoid'
    gem 'cache_digests'
    gem 'mongoid-ancestry'
    gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails'  
    gem 'bootstrap-will_paginate'
    gem 'bootstrap_helper'

    route %Q(mount Unirole::Engine => '/unirole', as: 'unirole_app')
  end

  def copy_additional_file
    copy_file 'tree.jquery.js', 'app/assets/javascripts/tree.jquery.js'
    copy_file 'jqtree.css', 'app/assets/stylesheets/jqtree.css'
  end


  def inject_css_and_js
    inject_into_file 'app/assets/javascripts/application.js', after: "//= require jquery_ujs\n" do <<-'RUBY'
//= require twitter/bootstrap
//= require tree.jquery
    RUBY
    end

    inject_into_file 'app/assets/stylesheets/application.css', after: " *= require_self\n" do <<-'RUBY'
 *= require twitter/bootstrap
 *= require twitter/bootstrap-responsive
 *= require jqtree
    RUBY
    end
  end
end
