# frozen_string_literal: true

require 'helper'

class TestAddressFR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressFR,
    :city, :full_address, :street_name, :postal_code, :region
  )
end
