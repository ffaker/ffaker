require 'helper'

class TestAddressUSUS < Test::Unit::TestCase
  def test_us_state
    assert_match /[ a-z]/, Faker::AddressUS.state
  end

  def test_us_state_abbr
    assert_match /[A-Z]/, Faker::AddressUS.state_abbr
  end

  def test_zip_code
    assert_match /[0-9]/, Faker::AddressUS.zip_code
  end

  def test_zip_code_frozen
    assert Faker::AddressUS.zip_code.frozen? == false
  end
end
