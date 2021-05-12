# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberPL < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberPL,
    :home_work_phone_number, :mobile_phone_number, :phone_number,
    :area_code, :mobile_prefix,
    :international_mobile_phone_number,
    :international_home_work_phone_number,
    :international_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberPL
  end

  def test_home_work_phone_number
    assert_match(/\A\d{9}\z/, @tester.home_work_phone_number)
  end

  def test_mobile_phone_number
    assert_match(/\A\d{9}\z/, @tester.mobile_phone_number)
  end

  def test_phone_number
    assert_match(/\A\d{9}\z/, @tester.phone_number)
  end

  def test_country_code
    assert_equal(@tester::COUNTRY_CODE, '+48')
  end

  def test_international_mobile_phone_number
    assert_match(/\A\+48 \d{9}\z/, @tester.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/\A\+48 \d{9}\z/, @tester.international_home_work_phone_number)
  end

  def test_international_phone_number
    assert_match(/\A\+48 \d{9}\z/, @tester.international_phone_number)
  end

  def test_area_code
    assert_include(@tester::AREA_CODES, @tester.area_code)
  end

  def test_mobile_prefixes
    assert_include(@tester::MOBILE_PREFIXES, @tester.mobile_prefix)
  end
end
