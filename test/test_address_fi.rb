# encoding: utf-8

require 'helper'

# Test features related to Finnish addresses
class TestAddressFI < Test::Unit::TestCase
  ALPHA = /\A[[:alpha:]]+/
  DIGIT = /\d{1}/

  def test_fi_city
    assert_match ALPHA, Faker::AddressFI.city
  end

  def test_fi_zip_code
    assert_match(/\d{2}/, Faker::AddressFI.zip_code)
  end

  def test_countries
    assert Faker::AddressFI::COUNTRIES.include?(Faker::AddressFI.random_country)
  end

  def test_fi_full_address
    address = Faker::AddressFI.full_address
    assert_match ALPHA, address
    assert_match DIGIT, address
    assert_match(/SUOMI/, address)
    assert_match(/[\, a-z]/, address)
  end

  def test_fi_zip_code_frozen
    assert Faker::AddressFI.zip_code.frozen? == false
  end
end
