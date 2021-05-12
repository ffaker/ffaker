# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberSE < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberSE,
    :mobile_prefix, :area_prefix, :country_prefix, :mobile_phone_number,
    :home_work_phone_number, :phone_number, :international_mobile_phone_number,
    :international_home_work_phone_number, :international_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberSE
  end

  ALLOWED_CHARS = /[()\d +-]/.freeze

  def test_mobile_phone_prefix
    assert FFaker::PhoneNumberSE::MOBILE_PHONE_PREFIX.include?(@tester.mobile_prefix)
  end

  def test_home_work_phone_prefix
    assert FFaker::PhoneNumberSE::PHONE_PREFIX.include?(@tester.area_prefix)
  end

  def test_country_prefix
    assert FFaker::PhoneNumberSE::COUNTRY_PREFIX.include?(@tester.country_prefix)
  end

  def test_mobile_phone_number
    assert_match(ALLOWED_CHARS, FFaker::PhoneNumberSE.mobile_phone_number)
    assert_match(/\d{3}/, FFaker::PhoneNumberSE.mobile_phone_number)
    assert_greater_than FFaker::PhoneNumberSE.mobile_phone_number.length, 9
  end

  def test_home_work_phone_number
    assert_match(ALLOWED_CHARS, FFaker::PhoneNumberSE.home_work_phone_number)
    assert_match(/\d{1} \d{2}/, FFaker::PhoneNumberSE.home_work_phone_number)
    assert_greater_than FFaker::PhoneNumberSE.mobile_phone_number.length, 9
  end

  def test_phone_number
    10.times do
      assert_match(ALLOWED_CHARS, FFaker::PhoneNumberSE.phone_number)
    end
  end

  def test_international_mobile_phone_number
    assert_match(/46/, FFaker::PhoneNumberSE.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/46/, FFaker::PhoneNumberSE.international_home_work_phone_number)
  end

  def test_international_phone_number
    10.times do
      assert_match(ALLOWED_CHARS, FFaker::PhoneNumberSE.international_phone_number)
      assert_match(/46/, FFaker::PhoneNumberSE.international_phone_number)
    end
  end
end
