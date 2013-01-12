$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "unirole/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "unirole"
  s.version     = Unirole::VERSION
  s.authors     = ["XieGang"]
  s.email       = ["xiegang@zhiyisoft.com"]
  s.homepage    = "http://www.zhiyisoft.com/users/xiegang/projects/unirole"
  s.summary     = "unirole module of zhiyisoft.com"
  s.description = "Simple role settings of one organ"

  s.files = Dir["{app,config,db,lib,public}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "mongoid"
  s.add_dependency "bson_ext"
  s.add_dependency "cancan"
  s.add_dependency "rubycas-client"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "database_cleaner"
end
