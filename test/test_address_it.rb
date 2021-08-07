# frozen_string_literal: true

require_relative 'helper'

class TestAddressIT < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressIT,
    :city, :full_address, :street_address, :postal_code, :region
  )
end
