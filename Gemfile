require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://ruby.taobao.org'
gemspec

gem 'rails', '>= 3.2.11'
gem 'thin'

case HOST_OS
  when /darwin/i
    gem 'rb-fsevent', :group => :development
    gem 'growl', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
    gem 'rb-fchange', :group => :development
    gem 'win32console', :group => :development
    gem 'rb-notifu', :group => :development
end

# jquery-rails is used by the dummy application
gem "jquery-rails"
gem "slim"
gem "haml"
gem "mongoid", "~> 3.0"
gem "thin"
gem "i18n"
gem 'zhiyi-member', :git => 'git@task.zhiyisoft.com:talent/zhiyi/zhiyi-member.git'
gem 'cancan'

gem 'simple_form'
gem 'nested_form'
gem 'apotomo'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'factory_girl_rails', :require => false
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem "capybara"
  gem "launchy"
  gem 'guard-spork'
  gem 'spork'
  gem "guard-rspec"
  gem 'guard-livereload'
  gem 'guard-bundler'
  gem 'rb-fsevent'
end
