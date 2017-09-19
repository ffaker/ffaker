# encoding: utf-8
# frozen_string_literal: true

require 'helper'

class TestAddressKR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressKR,
    :postal_code, :old_postal_code, :road_addess, :land_address, :land_number,
    :building_name, :address_detail, :street, :town, :borough, :city, :province,
    :metropolitan_city
  )
end
