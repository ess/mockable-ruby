require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/tmp/'
  add_filter '/mock/'
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mockable'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
