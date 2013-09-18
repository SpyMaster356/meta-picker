# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'meta-picker/version'

Gem::Specification.new do |spec|
  spec.name          = "meta-picker"
  spec.version       = MetaPicker::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.date          = '2013-07-11'
  spec.authors       = ["Stephen A. Wilson"]
  spec.email         = ["stephen.wilson@mosaic.com"]
  spec.description   = %q{}
  spec.summary       = %q{Allows for easy reading of a page's meta data}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_path = "lib"
  spec.require_paths = ["lib"]

  spec.required_rubygems_version = ">= 1.3.4"

  if RUBY_VERSION < '1.9.2'
    spec.add_dependency 'nokogiri', '~>1.5.10'
  else
    spec.add_dependency 'nokogiri'
  end
  spec.add_dependency 'hashie'
  spec.add_dependency 'faraday'

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
end