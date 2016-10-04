# encoding: utf-8

require 'helper'

class TestAddressUK < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressUK,
    :country, :county, :postcode
  )

  def test_county
    assert_match(/[ a-z]/, FFaker::AddressUK.county)
  end

  def test_country
    assert_match(/[ a-z]/, FFaker::AddressUK.country)
  end

  def test_postcode
    assert_match(/^[A-Z]{2}\d \d[A-Z]{2}|[A-Z]{2}\d\d \d[A-Z]{2}$/,
                 FFaker::AddressUK.postcode)
  end
end
