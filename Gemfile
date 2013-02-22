#source "https://rubygems.org"
#source "http://ruby.taobao.org"
source "http://localhost:8808"

# Declare your gem's dependencies in unirole.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"
gem "slim"
gem "haml"
gem "mongoid", "~> 3.0"
gem "thin"
gem "i18n"
gem 'zhiyi-member', :git => 'git@task.zhiyisoft.com:talent/zhiyi/zhiyi-member.git'
gem 'cancan'
gem 'nested_form'

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

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
