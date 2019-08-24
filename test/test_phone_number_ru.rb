# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberRU < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberRU,
    :international_phone_number, :international_mobile_phone_number,
    :international_home_work_phone_number, :international_toll_free_number,
    :phone_number, :mobile_phone_number, :home_work_phone_number,
    :toll_free_number, :international_country_code, :country_code,
    :home_work_phone_prefix, :mobile_phone_prefix
  )

  def setup
    @tester = FFaker::PhoneNumberRU
  end

  def test_international_phone_number
    assert_match(/\A\+7 \d{3} \d{3}-\d{2}-\d{2}\z/,
                 @tester.international_phone_number)
  end

  def test_international_mobile_phone_number
    assert_match(/\A\+7 \d{3} \d{3}-\d{2}-\d{2}\z/,
                 @tester.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/\A\+7 \d{3} \d{3}-\d{2}-\d{2}\z/,
                 @tester.international_home_work_phone_number)
  end

  def test_international_toll_free_number
    assert_match(/\A\+7 800 \d{3}-\d{2}-\d{2}\z/,
                 @tester.international_toll_free_number)
  end

  def test_phone_number
    assert_match(/\A8 \d{3} \d{3}-\d{2}-\d{2}\z/,
                 @tester.mobile_phone_number)
  end

  def test_mobile_phone_number
    assert_match(/\A8 \d{3} \d{3}-\d{2}-\d{2}\z/,
                 @tester.mobile_phone_number)
  end

  def test_home_work_phone_number
    assert_match(/\A8 \d{3} \d{3}-\d{2}-\d{2}\z/,
                 @tester.mobile_phone_number)
  end

  def test_toll_free_number
    assert_match(/\A8 800 \d{3}-\d{2}-\d{2}\z/,
                 @tester.toll_free_number)
  end

  def test_international_country_code
    assert_match('+7', @tester.international_country_code)
  end

  def test_country_code
    assert_match('8', @tester.country_code)
  end

  def test_home_work_phone_prefix
    assert_include(@tester::HOME_PHONE_PREFIXES, @tester.home_work_phone_prefix)
  end

  def test_mobile_phone_prefix
    assert_include(@tester::MOBILE_PHONE_PREFIXES, @tester.mobile_phone_prefix)
  end
end
