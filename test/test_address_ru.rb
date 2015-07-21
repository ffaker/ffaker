# encoding: utf-8

require 'helper'

class TestAddressRU < Test::Unit::TestCase

  def setup
    @tester = FFaker::AddressRU
  end

  def test_city
    assert_match /\A[a-zа-я\-\s]+\z/i, @tester.city
  end

  def test_province
    assert_match /\A[a-zа-я\-\s]+\z/i, @tester.province
  end

  def test_zip_code
    assert_match /^\d{6}$/, @tester.zip_code
  end

  def test_street_name
    assert_match /\A[a-zа-я.\-\s]+\z/i, @tester.street_name
  end

  def test_street_address
    assert_match /\A[a-zа-я.,\-\s\d]+\z/i, @tester.street_address
  end
end
