# frozen_string_literal: true

require_relative 'helper'

class TestAddressVN < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressVN,
    :zip_code, :province, :province_abbr, :city, :street_prefix, :street_name, :street_address
  )

  def setup
    @tester = FFaker::AddressVN
  end

  def test_zip_code
    assert_match(/\A\d{6}\z/, @tester.zip_code)
  end

  def test_province
    assert_include @tester::PROVINCE, @tester.province
  end

  def test_province_abbr
    assert_include @tester::PROVINCE_ABBR, @tester.province_abbr
  end

  def test_city
    assert_include @tester::CITY, @tester.city
  end

  def test_street_prefix
    assert_include @tester::STREET_PREFIXES, @tester.street_prefix
  end

  def test_street_name
    assert_include @tester::STREET_NAMES, @tester.street_name
  end

  def test_street_address
    prefixes = @tester::STREET_PREFIXES
    street_names = @tester::STREET_NAMES
    regex = /\A\d+ (#{prefixes.join('|')}) (#{Regexp.union(street_names).source})\z/
    assert_match(regex, @tester.street_address)
  end
end
