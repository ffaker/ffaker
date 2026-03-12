# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberGB < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberGB,
    :mobile_prefix, :region_prefix, :mobile_phone_number, :home_work_phone_number,
    :country_code, :international_mobile_phone_number, :international_home_work_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberGB
  end

  def test_mobile_prefix
    assert_match(/\A07[0-9]{3}\z/, @tester.mobile_prefix)
  end

  def test_mobile_prefix_without_leading_zero
    assert_match(/\A7[0-9]{3}\z/, @tester.mobile_prefix(false))
  end

  def test_region_prefix
    assert_match(/\A0[1-9][0-9]{1,4}\z/, @tester.region_prefix)
  end

  def test_region_prefix_without_leading_zero
    assert_match(/\A[1-9][0-9]{1,4}\z/, @tester.region_prefix(false))
  end

  def test_mobile_phone_number
    assert_match(/\A07[0-9]{3} [0-9]{7}\z/, @tester.mobile_phone_number)
  end

  def test_home_work_phone_number
    number = @tester.home_work_phone_number
    assert_match(/\A0[1-9][0-9]{1,4} /, number) # starts with a region code
    assert_match(/\A0[0-9]{10}\z/, number.gsub(/\s/, '')) # has 11 digits in total
  end

  def test_country_code
    assert_match('+44', @tester.country_code)
  end

  def test_international_mobile_phone_number
    assert_match(/\A\+44 7[0-9]{3} [0-9]{7}\z/, @tester.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    number = @tester.international_home_work_phone_number
    assert_match(/\A\+44 [1-9][0-9]{1,4} /, number) # starts with country and region codes
    assert_match(/\A\+44[0-9]{10}\z/, number.gsub(/\s/, '')) # remainder is 10 digits
  end
end
