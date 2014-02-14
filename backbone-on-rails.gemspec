$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "backbone-on-rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "backbone-on-rails"
  s.version     = BackboneOnRails::VERSION
  s.authors     = ["William Meleyal"]
  s.email       = ["william.meleyal@gmail.com"]
  s.homepage    = "http://github.com/meleyal/backbone-on-rails"
  s.summary     = "A simple gem for using Backbone with Rails"
  s.description = "A simple gem for using Backbone with Rails (>= 3.1), based on thoughtbot's 'Backbone.js on Rails'"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")

  # Enable usage with non-active_record projects by only depending on the parts of rails we need.
  s.add_dependency 'railties'
  s.add_dependency 'actionpack'
  s.add_dependency 'actionmailer'
  s.add_dependency 'activemodel'
  s.add_dependency 'activeresource'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'ejs'
  s.add_dependency 'eco'

  s.add_development_dependency 'rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'turn'
end
