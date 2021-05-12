# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberFR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberFR,
    :phone_number, :home_work_phone_number, :mobile_phone_number,
    :international_phone_number, :international_mobile_phone_number,
    :international_home_work_phone_number, :country_code
  )

  def setup
    @tester = FFaker::PhoneNumberFR
  end

  def test_phone_number
    10.times do
      assert_match(/^0[1-9](\s?\d{2}){4}$/, @tester.phone_number)
    end
  end

  def test_home_work_phone_number
    assert_match(/^0([1-5]|[8-9])(\s?\d{2}){4}$/,
                 @tester.home_work_phone_number)
  end

  def test_mobile_phone_number
    assert_match(/^0([6-7])(\s?\d{2}){4}$/,
                 @tester.mobile_phone_number)
  end

  def test_international_phone_number
    10.times do
      assert_match(/^(\+|00)33\s?([1-9])(\s?\d{2}){4}$/,
                   @tester.international_phone_number)
    end
  end

  def test_international_mobile_phone_number
    assert_match(/^(\+|00)33\s?([6-7])(\s?\d{2}){4}$/,
                 @tester.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/^(\+|00)33\s?([1-5]|[8-9])(\s?\d{2}){4}$/,
                 @tester.international_home_work_phone_number)
  end

  def test_country_code
    10.times do
      assert_match(/(\+|00)33/, @tester.country_code)
    end
  end
end
