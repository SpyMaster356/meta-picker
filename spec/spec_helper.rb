require 'simplecov'
SimpleCov.start

require 'rubygems'
require 'test/unit'
require 'vcr'
require 'meta-picker'

SPEC_DIR = File.dirname(__FILE__)
require "#{SPEC_DIR}/vcr/vcr"

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
end