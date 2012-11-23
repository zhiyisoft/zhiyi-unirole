$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "role/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "role"
  s.version     = Role::VERSION
  s.authors     = ["TODO: XieGang"]
  s.email       = ["TODO: tianbymy@163.com xiegang@zhiyisoft.com"]
  s.homepage    = "TODO: index"
  s.summary     = "TODO: Summary of Role."
  s.description = "TODO: 角色管理"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.9"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
