# Configure Rails Envinronment
ENV["RAILS_ENV"] = "test"

require 'mongoid'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require "factory_girl_rails"
require "database_cleaner"
require 'shoulda/matchers/integrations/rspec'

ENGINE_RAILS_ROOT=File.join(File.dirname(__FILE__), '../')

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
