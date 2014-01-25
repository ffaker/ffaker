# encoding: utf-8

require 'helper'

class TestAddressBR < Test::Unit::TestCase
  def test_zip_code
    assert_match /\d{5}-\d{3}/, Faker::AddressBR.zip_code
  end

  def test_state
    assert Faker::AddressBR::STATE.include?(Faker::AddressBR.state)
  end

  def test_state_abbr
    assert Faker::AddressBR::STATE_ABBR.include?(Faker::AddressBR.state_abbr)
  end

  def test_city
    assert Faker::AddressBR::CITY.include?(Faker::AddressBR.city)
  end

  def test_street_prefix
    assert Faker::AddressBR::STREET_PREFIX.include?(Faker::AddressBR.street_prefix)
  end

  def test_street
    prefixes = Faker::AddressBR::STREET_PREFIX
    assert_match /(#{prefixes.join('|')})( [[:alpha:]]+){1,2}/, Faker::AddressBR.street
  end
end
