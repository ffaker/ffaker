# frozen_string_literal: true

require_relative 'helper'

class TestAddressBR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressBR,
    :zip_code, :state, :state_abbr, :city, :street_prefix, :street, :complement, :neighborhood, :full_address
  )

  def test_zip_code
    assert_match(/\d{5}-\d{3}/, FFaker::AddressBR.zip_code)
  end

  def test_state
    assert FFaker::AddressBR::STATE.include?(FFaker::AddressBR.state)
  end

  def test_state_abbr
    assert FFaker::AddressBR::STATE_ABBR.include?(FFaker::AddressBR.state_abbr)
  end

  def test_city
    assert FFaker::AddressBR::CITY.include?(FFaker::AddressBR.city)
  end

  def test_street_prefix
    assert FFaker::AddressBR::STREET_PREFIX.include?(FFaker::AddressBR.street_prefix)
  end

  def test_street
    prefixes = FFaker::AddressBR::STREET_PREFIX
    assert_match(/\A(#{prefixes.join('|')})(?: [\p{Alpha}-]+)+\z/, FFaker::AddressBR.street)
  end

  def test_complement
    assert_match(/\A(?:Apartamento \d{3}|Casa Térrea|Fundos)\z/, FFaker::AddressBR.complement)
  end

  def test_neighborhood
    neighborhood_prefix = FFaker::AddressBR.neighborhood.split(' ').first
    assert FFaker::AddressBR::NEIGHBORHOOD_PREFIXES.include?(neighborhood_prefix)
  end

  def test_full_address
    assert_match(/\A[\p{Alpha}\d, -]+\z/, FFaker::AddressBR.full_address)
  end
end
