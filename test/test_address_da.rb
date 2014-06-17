# encoding: utf-8

require 'helper'

class TestAddressDA < Test::Unit::TestCase
  def test_zip_code
    assert_match /^\d{4}$/, Faker::AddressDA.zip_code
  end

  def test_post_nr
    assert_match /^\d{4}$/, Faker::AddressDA.post_nr
  end

  def test_state
    assert_match /[ a-z]/, Faker::AddressDA.state
  end

  def test_kommune
    assert_match /[ a-z]/, Faker::AddressDA.kommune
  end

  def region
    assert_match /[ a-z]/, Faker::AddressDA.region
  end

  def test_city
    assert_match /[ a-z]+/, Faker::AddressDA.city
  end

  def test_street_name
    assert_match /[ a-z]+/, Faker::AddressDA.street_name
  end

  def test_street_address
    assert_match /[ a-z]+/, Faker::AddressDA.street_address
  end

  def test_full_address
    assert_match /[ a-z]+/, Faker::AddressDA.full_address
  end
end
