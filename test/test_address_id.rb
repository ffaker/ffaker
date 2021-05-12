# frozen_string_literal: true

require_relative 'helper'

class TestAddressID < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressID,
    :zip_code, :state, :state_abbr, :city, :street_prefix, :street
  )

  def test_zip_code
    assert_match(/\A\d{5}\z/, FFaker::AddressID.zip_code)
  end

  def test_state
    assert FFaker::AddressID::STATE.include?(FFaker::AddressID.state)
  end

  def test_state_abbr
    assert FFaker::AddressID::STATE_ABBR.include?(FFaker::AddressID.state_abbr)
  end

  def test_city
    assert_include FFaker::AddressID::CITY, FFaker::AddressID.city
  end

  def test_street_prefix
    assert FFaker::AddressID::STREET_PREFIX.include?(FFaker::AddressID.street_prefix)
  end

  def test_street
    prefixes = FFaker::AddressID::STREET_PREFIX
    common_street_names = FFaker::AddressID::COMMON_STREET_NAMES
    regex = /\A(#{prefixes.join('|')})\.(\s(#{common_street_names.join('|')})),\sNo\.\s\d+\z/
    assert_match(regex, FFaker::AddressID.street)
  end
end
