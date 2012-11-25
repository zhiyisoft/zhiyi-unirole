$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "unirole/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "unirole"
  s.version     = Unirole::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Unirole."
  s.description = "TODO: Description of Unirole."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "mongoid"
  s.add_dependency "bson_ext"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
