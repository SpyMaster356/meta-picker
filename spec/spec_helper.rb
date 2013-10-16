if RUBY_VERSION >= '1.9.3'
  require 'simplecov'
  require 'simplecov-rcov'

  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::RcovFormatter,
  ]

  SimpleCov.start do
    add_filter 'spec'
  end
else
  require 'rspec/autorun'
end

require 'rubygems'
require 'test/unit'
require 'vcr'
require 'meta-picker'

SPEC_DIR = File.dirname(__FILE__)
require "#{SPEC_DIR}/vcr/vcr"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end