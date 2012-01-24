# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "backbone-on-rails/version"

Gem::Specification.new do |s|
  s.name        = "backbone-on-rails"
  s.version     = BackboneOnRails::VERSION
  s.authors     = ["William Meleyal"]
  s.email       = ["william.meleyal@gmail.com"]
  s.homepage    = "http://github.com/meleyal/backbone-on-rails"
  s.summary     = "A simple gem for using Backbone with Rails"
  s.description = "A simple gem for using Backbone with Rails (>= 3.1), based on thoughtbot's 'Backbone.js on Rails'"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'railties', '>= 3.1'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'ejs', '~> 1.0.0'
  s.add_dependency 'eco', '~> 1.0.0'
end
