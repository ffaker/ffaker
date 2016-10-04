# encoding: utf-8

require 'helper'

# Test features related to Finnish addresses
class TestAddressFR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressFR,
    :city, :full_address, :street_name, :postal_code
  )
end
