# frozen_string_literal: true

require_relative 'helper'

class TestFakerAddressPL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressPL,
    :full_address, :street_address, :street_name, :street, :square, :voivodeship,
    :voivodeship_abbr, :voivodeship_capital_city, :city, :building_number,
    :secondary_number, :postal_code, :street_prefix, :square_prefix
  )

  def setup
    @tester = FFaker::AddressPL
  end

  def test_full_address
    assert_match(/[a-z]/, @tester.full_address)
  end

  def test_full_address_includes_country
    assert_match(/POLOGNE/, @tester.full_address(true))
  end

  def street_address
    assert_match(/[a-z]/, @tester.street_address)
  end

  def street_name
    prefix, street = @tester.street_name.split
    assert_include(@tester::STREET_PREFIXES + @tester::SQUARE_PREFIXES, prefix)
    assert_include(@tester::STREET + @tester::SQUARE, street)
  end

  def street
    assert_include(@tester::STREET, @tester.street)
  end

  def square
    assert_include(@tester::SQUARE, @tester.square)
  end

  def voivodeship
    assert_include(@tester::VOIVODESHIP, @tester.voivodeship)
  end

  def voivodeship_abbr
    assert_include(@tester::VOIVODESHIP_ABBR, @tester.voivodeship_abbr)
  end

  def voivodeship_capital_city
    assert_include(@tester::VOIVODESHIP_CAPITAL_CITY, @tester.voivodeship_capital_city)
  end

  def city
    assert_include(@tester::CITY, @tester.city)
  end

  def building
    assert_match(/\d{1,3}/, @tester.building)
  end

  def secondary_number
    assert_match(/\d{1,3}/, @tester.secondary_number.split.last)
  end

  def postal_code
    assert_match(/\d{2}-\d{3}/, @tester.postal_code)
  end

  def street_prefix
    assert_include(@tester::STREET_PREFIXES, @tester.square_prefix)
  end

  def square_prefix
    assert_include(@tester::SQUARE_PREFIXES, @tester.square_prefix)
  end
end
