# encoding: utf-8

require 'helper'

class TestAddressSE < Test::Unit::TestCase

  ALPHA = /\A[[:alpha:]]+/
  DIGIT = /\d{1}/

  def test_se_city
    assert_match ALPHA, Faker::AddressSE.city
  end

  def test_se_zip_code
    assert_match(/\d{2}/, Faker::AddressSE.zip_code)
  end

  def test_countries
    assert Faker::AddressSE::COUNTRIES.include?(Faker::AddressSE.random_country)
  end

  def test_se_full_address
    address = Faker::AddressSE.full_address
    assert_match ALPHA, address
    assert_match DIGIT, address
    assert_match(/SVERIGE/, address)
    assert_match(/[\, a-z]/, address)
  end

  def test_se_zip_code_frozen
    assert Faker::AddressSE.zip_code.frozen? == false
  end
end
