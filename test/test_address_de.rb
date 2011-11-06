require 'helper'

class TestAddressDE < Test::Unit::TestCase
  def test_city
    assert_match /[ a-z]+/, Faker::Address.city
  end

  def test_state
    assert_match /[ a-z]/, Faker::Address.us_state
  end
end
