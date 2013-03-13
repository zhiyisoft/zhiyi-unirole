require 'rubygems'
require 'spork'
require 'simplecov'

Spork.prefork do
  ENV["RAILS_ENV"] ||= "test"

  require 'mongoid'
  ENV["MONGOID_ENV"] = "test"
  Mongoid.load!(File.expand_path("../dummy/config/mongoid.yml",  __FILE__))

  require File.expand_path("../dummy/config/environment.rb",  __FILE__)

  require 'rspec/rails'
  require 'turnip'
  require 'capybara/rspec'
  require "factory_girl_rails"
  require "database_cleaner"

  ENGINE_RAILS_ROOT = File.join(File.dirname(__FILE__), '../')
  Dir[File.join(ENGINE_RAILS_ROOT, "spec/support/**/*.rb")].each {|f| require f }

  require 'capybara/poltergeist'
  Capybara.javascript_driver = :poltergeist

  #Capybara.default_driver = :selenium
  #Capybara.app_host = "http://localhost:3000"
  #Capybara.default_wait_time = 5

  #Capybara.register_driver :selenium do |app|
  #  Capybara::Selenium::Driver.new(app, :browser => :firefox) # chrome)
  #end


  RSpec.configure do |config|

    config.mock_with :rspec
    config.include FactoryGirl::Syntax::Methods
    config.include Unirole::Engine.routes.url_helpers

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
end


Spork.each_run do
  load "#{ENGINE_RAILS_ROOT}/config/routes.rb"
  Dir["#{ENGINE_RAILS_ROOT}/app/models/**/*.rb"].each {|f| load f}

  FactoryGirl.reload
  SimpleCov.start
end
