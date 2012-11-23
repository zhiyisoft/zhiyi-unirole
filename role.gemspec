$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "role/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "role"
  s.version     = Role::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Role."
  s.description = "TODO: Description of Role."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
