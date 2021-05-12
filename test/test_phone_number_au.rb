# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberAU < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberAU,
    :mobile_phone_prefix, :home_work_phone_prefix, :phone_prefix,
    :mobile_phone_number, :home_work_phone_number, :phone_number,
    :international_mobile_phone_number,
    :international_home_work_phone_number,
    :international_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberAU
  end

  def test_mobile_phone_prefix
    assert_include(FFaker::PhoneNumberAU::MOBILE_OPERATORS_PREFIX,
                   @tester.mobile_phone_prefix)
  end

  def test_home_work_phone_prefix
    assert_include(FFaker::PhoneNumberAU::HOME_WORK_OPERATORS_PREFIX,
                   @tester.home_work_phone_prefix)
  end

  def test_phone_prefix
    assert_include(FFaker::PhoneNumberAU::OPERATORS_PREFIX,
                   @tester.phone_prefix)
  end

  def test_mobile_phone_number
    assert_match(/0[45]\d{2} \d{3} \d{3}/,
                 FFaker::PhoneNumberAU.mobile_phone_number)
  end

  def test_home_work_phone_number
    assert_match(/\(\d{2}\) \d{4} \d{4}/,
                 FFaker::PhoneNumberAU.home_work_phone_number)
  end

  def test_phone_number
    assert_match(/(?:0[45]\d{1,2} \d{3} \d{3}|\(\d{2}\) \d{4} \d{4})/,
                 FFaker::PhoneNumberAU.phone_number)
  end

  def test_international_mobile_phone_number
    assert_match(/\+61 \d{1,2} \d{4} \d{4}/,
                 FFaker::PhoneNumberAU.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/\+61 \d{1,2} \d{4} \d{4}/,
                 FFaker::PhoneNumberAU.international_home_work_phone_number)
  end

  def test_international_phone_number
    assert_match(/\+61 \d{1,2} \d{4} \d{4}/,
                 FFaker::PhoneNumberAU.international_phone_number)
  end
end
