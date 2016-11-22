# frozen_string_literal: true
# encoding: utf-8

require 'helper'

class TestAddressID < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressID,
    :zip_code, :state, :state_abbr, :city, :street_prefix, :street
  )

  def test_zip_code
    assert_match(/\d{5}/, FFaker::AddressID.zip_code)
  end

  def test_state
    assert FFaker::AddressID::STATE.include?(FFaker::AddressID.state)
  end

  def test_state_abbr
    assert FFaker::AddressID::STATE_ABBR.include?(FFaker::AddressID.state_abbr)
  end

  def test_city
    assert FFaker::AddressID::CITY.include?(FFaker::AddressID.city)
  end

  def test_street_prefix
    assert FFaker::AddressID::STREET_PREFIX.include?(FFaker::AddressID.street_prefix)
  end

  def test_street
    prefixes = FFaker::AddressID::STREET_PREFIX
    hero_names = FFaker::AddressID::HERO_NAMES
    regex = /(#{prefixes.join('|')})\.(\s(#{hero_names.join('|')}))\,\sNo\.\s\d+/
    assert_match(regex, FFaker::AddressID.street)
  end
end
