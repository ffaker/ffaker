# encoding: utf-8

require 'helper'

class TestAddressUK < Test::Unit::TestCase
  def test_county
    assert_match /[ a-z]/, Faker::AddressUK.county
  end

  def test_country
    assert_match /[ a-z]/, Faker::AddressUK.country
  end

  def test_postcode
    assert_match /^[A-Z]{2}\d \d[A-Z]{2}|[A-Z]{2}\d\d \d[A-Z]{2}$/, Faker::AddressUK.postcode
  end
end
