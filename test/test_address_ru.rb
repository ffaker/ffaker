# encoding: utf-8

require 'helper'

class TestAddressRU < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::AddressRU,
    :city, :province, :street_address, :street_name, :zip_code
  )

  def setup
    @tester = FFaker::AddressRU
  end

  def test_city
    assert_match(/\A[a-zа-яё\-\s]+\z/i, @tester.city)
  end

  def test_province
    assert_match(/\A[a-zа-яё\-\s]+\z/i, @tester.province)
  end

  def test_zip_code
    assert_match(/\A\d{6}\z/, @tester.zip_code)
  end

  def test_street_name
    assert_match(/\A[a-zа-яё.\-\s]+\z/i, @tester.street_name)
  end

  def test_street_address
    assert_match(/\A[a-zа-яё.,\-\s\d]+\z/i, @tester.street_address)
  end
end
