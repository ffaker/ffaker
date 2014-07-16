# encoding: utf-8

require 'helper'

class TestAddressUSUS < Test::Unit::TestCase
  def test_us_state
    assert_match /[ a-z]/, Faker::AddressUS.state
  end

  def test_us_state_abbr
    assert_match /[A-Z]/, Faker::AddressUS.state_abbr
  end

  def test_us_state_and_territories_abbr
    assert_match /[A-Z]/, Faker::AddressUS.state_and_territories_abbr
  end

  def test_us_continental_state
    assert_match /[ a-z]/, Faker::AddressUS.continental_state
  end

  def test_us_continental_state_abbr
    assert_match /[A-Z]/, Faker::AddressUS.continental_state_abbr
  end

  def test_zip_code
    assert_match /[0-9]/, Faker::AddressUS.zip_code
  end

  def test_zip_code_frozen
    assert Faker::AddressUS.zip_code.frozen? == false
  end
end
