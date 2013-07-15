# -*- encoding: utf-8 -*-
require File.expand_path('../lib/meta-picker/', __FILE__)

Gem::Specification.new do |s|
  s.name        = "meta-picker"
  s.version     = '0.1.1'
  s.platform    = Gem::Platform::RUBY
  s.date        = '2013-07-11'
  s.authors     = ["Stephen A. Wilson"]
  s.email       = ["stephen.wilson@mosaic.com"]
  s.homepage    = ""
  s.summary     = %q{}
  s.description = %q{}

  s.files = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"]
  s.require_path = "lib"

  s.required_rubygems_version = ">= 1.3.4"

  s.add_dependency 'nokogiri'
  s.add_dependency 'hashie'
  s.add_dependency 'faraday'

  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
  s.add_development_dependency "simplecov"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end