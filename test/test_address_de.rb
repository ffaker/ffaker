require 'test_helper'

class TestAddressDE < Minitest::Test
  def test_city
    assert_match /[ a-z]+/, FFaker::AddressDE.city
  end

  def test_state
    assert_match /[ a-z]/, FFaker::AddressDE.state
  end

  def test_zip_code
    assert_match /^\d{5}$/, FFaker::AddressDE.zip_code
  end

  def test_street_name
    assert_match /[ a-z]+/, FFaker::AddressDE.street_name
  end

  def test_street_address
    assert_match /[ a-z]+/, FFaker::AddressDE.street_address
  end
end
