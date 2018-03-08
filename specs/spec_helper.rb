require 'simplecov'
SimpleCov.start do
  add_filter "/specs/"
end
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
# Add simplecov

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/hotel_manager'
require_relative '../lib/reservation'
