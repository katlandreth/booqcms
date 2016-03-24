$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "booqcms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "booqcms"
  s.version     = Booqcms::VERSION
  s.authors     = ["Kat Landreth"]
  s.email       = ["katlandreth@gmail.com"]
  s.homepage    = "http://howtogimp.com"
  s.summary     = "Summary of Booqcms."
  s.description = "Description of Booqcms."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "pg"
end
