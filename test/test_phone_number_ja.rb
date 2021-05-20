# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberJA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberJA,
    :phone_number, :home_phone_number, :mobile_phone_number,
    :international_mobile_phone_number, :international_home_phone_number, :international_phone_number,
    :mobile_prefix, :home_phone_prefix
  )

  def setup
    @tester = FFaker::PhoneNumberJA
  end

  def test_phone_number
    assert_match(/\A0\d{1,4} \d{1,4} \d{4}\z/, @tester.phone_number)
    assert_include([12, 13], @tester.phone_number.length)
  end

  def test_home_phone_number
    assert_match(/\A0\d{1,4} \d{1,4} \d{4}\z/, @tester.home_phone_number)
    assert_equal(@tester.home_phone_number.length, 12)
  end

  def test_mobile_phone_number
    assert_match(/\A0(90|80|70) \d{4} \d{4}\z/, @tester.mobile_phone_number)
    assert_equal(@tester.mobile_phone_number.length, 13)
  end

  def test_international_phone_number
    assert_match(/\A\+81 \d{1,4} \d{1,4} \d{4}\z/, @tester.international_phone_number)
    assert_include([15, 16], @tester.international_phone_number.length)
  end

  def test_international_home_phone_number
    assert_match(/\A\+81 \d{1,4} \d{1,4} \d{4}\z/, @tester.international_home_phone_number)
    assert_equal(@tester.international_home_phone_number.length, 15)
  end

  def test_international_mobile_phone_number
    assert_match(/\A\+81 (90|80|70) \d{4} \d{4}\z/, @tester.international_mobile_phone_number)
    assert_equal(@tester.international_mobile_phone_number.length, 16)
  end

  def test_mobile_prefix
    assert_include(@tester::MOBILE_PHONE_PREFIXES, @tester.mobile_prefix)
  end

  def test_home_phone_prefix
    disit = rand(1..4)
    assert_include(
      @tester::ONE_DISIT_AREA_CODES +
        @tester::TWO_DISIT_AREA_CODES +
        @tester::THREE_DISIT_AREA_CODES +
        @tester::FOUR_DISIT_AREA_CODES,
      @tester.home_phone_prefix(disit)
    )
  end
end
