require 'helper'

class TestAddress < Test::Unit::TestCase
  def test_city
    assert_match /[ a-z]+/, Faker::Address.city
  end

  def test_city_prefix
    assert_match /[ a-z]/, Faker::Address.city_prefix
  end

  def test_city_suffix
    assert_match /[ a-z]/, Faker::Address.city_suffix
  end

  def test_secondary_address
    assert_match /[ a-z]/, Faker::Address.secondary_address
  end

  def test_street_address
    assert_match /[ a-z]/, Faker::Address.street_address
  end

  def test_street_name
    assert_match /[ a-z]/, Faker::Address.street_name
  end

  def test_street_suffix
    assert_match /[ a-z]/, Faker::Address.street_suffix
  end

  def test_uk_country
    assert_match /[ a-z]/, Faker::Address.uk_country
  end

  def test_uk_county
    assert_match /[ a-z]/, Faker::Address.uk_county
  end

  def test_uk_postcode
    assert_match /[ a-z]/, Faker::Address.uk_postcode
  end

  def test_us_state
    assert_match /[ a-z]/, Faker::Address.us_state
  end

  def test_us_state_abbr
    assert_match /[A-Z]/, Faker::Address.us_state_abbr
  end

  def test_zip_code
    assert_match /[0-9]/, Faker::Address.zip_code
  end

  def test_zip_code_frozen
    assert Faker::Address.zip_code.frozen? == false
  end

  def test_neighborhood
    assert_match /[ a-z]+/, Faker::Address::neighborhood
  end
end
