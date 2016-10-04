# encoding: utf-8

require 'helper'

# Test features related to Finnish addresses
class TestAddressFI < Test::Unit::TestCase
  include DeterministicHelper

  ALPHA = /\A[\p{Alpha}]+/
  DIGIT = /\d{1}/

  assert_methods_are_deterministic(
    FFaker::AddressFI,
    :city, :full_address, :random_country, :zip_code
  )

  def test_fi_city
    assert_match(ALPHA, FFaker::AddressFI.city)
  end

  def test_fi_zip_code
    assert_match(/\d{2}/, FFaker::AddressFI.zip_code)
  end

  def test_countries
    assert FFaker::AddressFI::COUNTRIES.include?(FFaker::AddressFI.random_country)
  end

  def test_fi_full_address
    address = FFaker::AddressFI.full_address
    assert_match(ALPHA, address)
    assert_match(DIGIT, address)
    assert_match(/SUOMI/, address)
    assert_match(/[\, a-z]/, address)
  end

  def test_fi_zip_code_frozen
    assert FFaker::AddressFI.zip_code.frozen? == false
  end
end
