# encoding: utf-8

require 'helper'

class TestAddressUSUS < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressUS,
    :continental_state_abbr, :continental_state,
    :state_abbr, :state_and_territories_abbr, :state,
    :zip_code
  )

  def test_us_state
    assert_match(/[ a-z]/, FFaker::AddressUS.state)
  end

  def test_us_state_abbr
    assert_match(/[A-Z]/, FFaker::AddressUS.state_abbr)
  end

  def test_us_state_and_territories_abbr
    assert_match(/[A-Z]/, FFaker::AddressUS.state_and_territories_abbr)
  end

  def test_us_continental_state
    assert_match(/[ a-z]/, FFaker::AddressUS.continental_state)
  end

  def test_us_continental_state_abbr
    assert_match(/[A-Z]/, FFaker::AddressUS.continental_state_abbr)
  end

  def test_zip_code
    assert_match(/[0-9]/, FFaker::AddressUS.zip_code)
  end

  def test_zip_code_frozen
    assert FFaker::AddressUS.zip_code.frozen? == false
  end
end
