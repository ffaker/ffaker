# encoding: utf-8

require 'helper'

# Author: Luilver<luilver@gmail.com>
class TestPhoneNumberCU < Test::Unit::TestCase
  def setup
    @tester = Faker::PhoneNumberCU
  end

  # Prefix format test
  #
  def test_mobile_phone_prefix
    assert Faker::PhoneNumberCU::MobileOperatorsPrefix.include?(
      @tester.mobile_phone_prefix)
  end

  def test_home_work_phone_prefix
    assert Faker::PhoneNumberCU::HomeWorkOperatorsPrefix.include?(
      @tester.home_work_phone_prefix)
  end

  def test_phone_prefix
    10.times do
      assert Faker::PhoneNumberCU::OperatorsPrefix.include?(
        @tester.phone_prefix)
    end
  end

  # General format test
  #
  def test_mobile_phone_number
    assert_match /05 \d{3} \d{4}/,
      Faker::PhoneNumberCU.mobile_phone_number
  end

  def test_home_work_phone_number
    assert_match /\(0(7\) \d{3}|\d{2}\) \d{2}) \d{4}/,
      Faker::PhoneNumberCU.home_work_phone_number
  end

  def test_general_phone_number
    10.times do
      assert_match /((05|\(07\)) \d{3}|\(0\d{2}\) \d{2}) \d{4}/,
        Faker::PhoneNumberCU.general_phone_number
    end
  end

  # International format tests
  #
  def test_international_mobile_phone_number
    assert_match /(00|\+)535 \d{3} \d{4}/,
      Faker::PhoneNumberCU.international_mobile_phone_number
  end

  def test_international_home_work_phone_number
    assert_match /(00|\+)53(7 \d{3}|\d{2} \d{2}) \d{4}/,
      Faker::PhoneNumberCU.international_home_work_phone_number
  end

  def test_international_phone_number
    10.times do
      assert_match /(00|\+)53((5|7) \d{3}|\d{2} \d{2}) \d{4}/,
        Faker::PhoneNumberCU.international_phone_number
    end
  end

  # E.164 format tests
  #
  def test_e164_mobile_phone_number
    assert_match /535\d{7}/,
      Faker::PhoneNumberCU.e164_mobile_phone_number
  end

  def test_e164_home_work_phone_number
    assert_match /53(7\d{7}|\d{2}\d{6})/,
      Faker::PhoneNumberCU.e164_home_work_phone_number
  end

  def test_e164_phone_number
    10.times do
      assert_match /53((5|7)\d{7}|\d{2}\d{6})/,
        Faker::PhoneNumberCU.e164_phone_number
    end
  end
end
