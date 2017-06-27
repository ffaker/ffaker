# encoding: utf-8

require 'helper'

class TestAddressUA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressUA,
    :city, :country, :province, :zip_code, :street_name, :street_address,
    :building_number, :appartment_number
  )

  def setup
    @tester = FFaker::AddressUA
    @multiple_words_name_regexp = /\A[а-яА-ЯіїєґІЇЄҐ’\-\s]+\z/
  end

  def test_city
    assert_match(@multiple_words_name_regexp, @tester.city)
  end

  def test_country
    assert_match(@multiple_words_name_regexp, @tester.country)
  end

  def test_province
    assert_match(@multiple_words_name_regexp, @tester.province)
  end

  def test_zip_code
    assert_match(/\A\d{5}\z/, @tester.zip_code)
  end

  def test_street_name
    assert_match(/\Aвул\.\s[а-яА-ЯіїєґІЇЄҐ’\-\s]+\z/, @tester.street_name)
  end

  def test_street_address
    assert_match(/\Aвул\.\s[а-яА-ЯіїєґІЇЄҐ’\-\s]+,\s\d{1,3}\z/, @tester.street_address)
  end

  def test_street_address_with_secondary
    assert_match( \
      /\Aвул\.\s[а-яА-ЯіїєґІЇЄҐ’\-\s]+,\s\d{1,3},\sкв\.\s\d{1,3}\z/,
      @tester.street_address(true)
    )
  end

  def test_building_number
    assert_match(/\A\d{1,3}\z/, @tester.building_number)
  end

  def test_appartment_number
    assert_match(/\A\d{1,3}\z/, @tester.appartment_number)
  end
end
