# encoding: utf-8

require 'helper'

# Author: Luilver<luilver@gmail.com>
class TestPhoneNumberCU < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberCU,
    :mobile_phone_prefix, :home_work_phone_prefix, :phone_prefix,
    :mobile_phone_number, :home_work_phone_number, :general_phone_number,
    :international_mobile_phone_number, :international_home_work_phone_number,
    :international_phone_number,
    :e164_mobile_phone_number, :e164_home_work_phone_number, :e164_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberCU
  end

  # Prefix format test
  #
  def test_mobile_phone_prefix
    assert FFaker::PhoneNumberCU::MobileOperatorsPrefix.include?(
      @tester.mobile_phone_prefix
    )
  end

  def test_home_work_phone_prefix
    assert FFaker::PhoneNumberCU::HomeWorkOperatorsPrefix.include?(
      @tester.home_work_phone_prefix
    )
  end

  def test_phone_prefix
    10.times do
      assert FFaker::PhoneNumberCU::OperatorsPrefix.include?(
        @tester.phone_prefix
      )
    end
  end

  # General format test
  #
  def test_mobile_phone_number
    assert_match(/05 \d{3} \d{4}/,
                 FFaker::PhoneNumberCU.mobile_phone_number)
  end

  def test_home_work_phone_number
    assert_match(/\(0(7\) \d{3}|\d{2}\) \d{2}) \d{4}/,
                 FFaker::PhoneNumberCU.home_work_phone_number)
  end

  def test_general_phone_number
    10.times do
      assert_match(/((05|\(07\)) \d{3}|\(0\d{2}\) \d{2}) \d{4}/,
                   FFaker::PhoneNumberCU.general_phone_number)
    end
  end

  # International format tests
  #
  def test_international_mobile_phone_number
    assert_match(/(00|\+)535 \d{3} \d{4}/,
                 FFaker::PhoneNumberCU.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/(00|\+)53(7 \d{3}|\d{2} \d{2}) \d{4}/,
                 FFaker::PhoneNumberCU.international_home_work_phone_number)
  end

  def test_international_phone_number
    10.times do
      assert_match(/(00|\+)53((5|7) \d{3}|\d{2} \d{2}) \d{4}/,
                   FFaker::PhoneNumberCU.international_phone_number)
    end
  end

  # E.164 format tests
  #
  def test_e164_mobile_phone_number
    assert_match(/535\d{7}/,
                 FFaker::PhoneNumberCU.e164_mobile_phone_number)
  end

  def test_e164_home_work_phone_number
    assert_match(/53(7\d{7}|\d{2}\d{6})/,
                 FFaker::PhoneNumberCU.e164_home_work_phone_number)
  end

  def test_e164_phone_number
    10.times do
      assert_match(/53((5|7)\d{7}|\d{2}\d{6})/,
                   FFaker::PhoneNumberCU.e164_phone_number)
    end
  end
end
