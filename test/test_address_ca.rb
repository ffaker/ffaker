# encoding: utf-8

require 'helper'

class TestAddressCA < Test::Unit::TestCase
  def test_province
    assert_match /[ a-z]/, Faker::AddressCA.province
  end

  def test_province_abbr
    assert_match /[A-Z][A-Z]/, Faker::AddressCA.province_abbr
  end

  def test_city
    assert Faker::AddressCA::CITY.include?(Faker::AddressCA.city)
  end

  def test_postal_code
    assert_match /[A-Z]\d[A-Z]\W\d[A-Z]\d/, Faker::AddressCA.postal_code
  end
end
