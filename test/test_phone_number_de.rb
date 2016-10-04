# encoding: utf-8

require 'helper'

# Author: lawitschka<moritz.lawitschka@urbanvention.com>
class TestPhoneNumberDE < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberDE,
    :mobile_prefix, :region_prefix, :mobile_phone_number, :home_work_phone_number,
    :country_code, :international_mobile_phone_number, :international_home_work_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberDE
  end

  def test_mobile_prefix
    assert_match(/^01[567]{1}[0-9]{1}$/, FFaker::PhoneNumberDE.mobile_prefix)
  end

  def test_mobile_prefix_without_leading_zero
    assert_match(/^1[567]{1}[0-9]{1}$/, FFaker::PhoneNumberDE.mobile_prefix(false))
  end

  def test_region_prefix
    assert_match(/^0[2-9]{1}[0-9]{1,3}$/, FFaker::PhoneNumberDE.region_prefix)
  end

  def test_region_prefix_without_leading_zero
    assert_match(/^[2-9]{1}[0-9]{1,3}$/, FFaker::PhoneNumberDE.region_prefix(false))
  end

  def test_mobile_phone_number
    assert_match(/^01[567]{1}[0-9]{1} [0-9]{7}$/, FFaker::PhoneNumberDE.mobile_phone_number)
  end

  def test_home_work_phone_number
    assert_match(/^0[2-9]{1}[0-9]{1,3} [0-9]{7}$/, FFaker::PhoneNumberDE.home_work_phone_number)
  end

  def test_country_code
    assert_match('+49', FFaker::PhoneNumberDE.country_code)
  end

  def test_international_mobile_phone_number
    assert_match(/^\+49 1[567]{1}[0-9]{1} [0-9]{7}$/, FFaker::PhoneNumberDE.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/^\+49 [2-9]{1}[0-9]{1,3} [0-9]{7}$/, FFaker::PhoneNumberDE.international_home_work_phone_number)
  end
end
