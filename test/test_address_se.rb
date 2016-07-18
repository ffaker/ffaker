# encoding: utf-8

require 'helper'

class TestAddressSE < Test::Unit::TestCase
  include DeterministicHelper

  ALPHA = /\A[\p{Alpha}]+/
  DIGIT = /\d{1}/

  assert_methods_are_deterministic(
    FFaker::AddressSE,
    :city, :random_country, :full_address, :zip_code
  )

  def test_se_city
    assert_match(ALPHA, FFaker::AddressSE.city)
  end

  def test_se_zip_code
    assert_match(/\d{2}/, FFaker::AddressSE.zip_code)
  end

  def test_countries
    assert FFaker::AddressSE::COUNTRIES.include?(FFaker::AddressSE.random_country)
  end

  def test_se_full_address
    address = FFaker::AddressSE.full_address
    assert_match(ALPHA, address)
    assert_match(DIGIT, address)
    assert_match(/SVERIGE/, address)
    assert_match(/[\, a-z]/, address)
  end

  def test_se_zip_code_frozen
    assert FFaker::AddressSE.zip_code.frozen? == false
  end
end
