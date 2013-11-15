$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "jezmail/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jezmail"
  s.version     = Jezmail::VERSION
  s.authors     = ["Thomas ballarin"]
  s.email       = ["tballarin@gmail.com"]
  s.homepage    = ""
  s.summary     = "Projet Test"
  s.description = "En cours de dev"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4"

  s.add_development_dependency "sqlite3"
end
