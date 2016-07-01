$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "dashboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "dashboard"
  s.version     = Dashboard::VERSION
  s.authors     = ["Kat Landreth"]
  s.email       = ["katlandreth@gmail.com"]
  s.homepage    = "http://howtogimp.com"
  s.summary     = "Create, convert, publish, track, and market digital content."
  s.description = "Dashboard is an all in one solution for digital publishing."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "coderay"
  s.add_dependency "redcarpet"
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'nprogress-rails'

  #image upload
  s.add_dependency 'carrierwave'
  s.add_dependency 'fog'
  s.add_dependency 'mini_magick'
  s.add_dependency 'figaro'
  s.add_dependency 'remotipart', '~> 1.2'

  #use inline svg images
  s.add_dependency 'inline_svg'

  #Pagination
  s.add_dependency 'will_paginate'

  #Authentication
  s.add_dependency 'devise', '3.5.1'

  #Drafts
  s.add_dependency 'draftsman', '~> 0.4.0'

  #DB
  s.add_development_dependency "pg"
end
