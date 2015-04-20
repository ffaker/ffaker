# encoding: utf-8

require 'helper'

class TestAddressES < Test::Unit::TestCase
  def test_es_province
    assert_match /[\sa-z]/i, Faker::AddressES.province
  end

  def test_postal_code
    assert_match /[0-9]/, Faker::AddressES.postal_code
  end

  def test_zip_code
    assert_match /[0-9]/, Faker::AddressES.zip_code
  end

  def test_es_city
    assert_match /[\sa-z]/i, Faker::AddressES.city
  end
end
