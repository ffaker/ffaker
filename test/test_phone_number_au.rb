# encoding: utf-8

require 'helper'

# Author: wiseleyb<wiseleyb@gmail.com>
class TestPhoneNumberAU < Test::Unit::TestCase
  def setup
    @tester = Faker::PhoneNumberAU
  end

  def test_mobile_phone_prefix
    assert Faker::PhoneNumberAU::MobileOperatorsPrefix.include?(@tester.mobile_phone_prefix)
  end

  def test_home_work_phone_prefix
    assert Faker::PhoneNumberAU::HomeWorkOperatorsPrefix.include?(@tester.home_work_phone_prefix)
  end

  def test_phone_prefix
    assert Faker::PhoneNumberAU::OperatorsPrefix.include?(@tester.phone_prefix)
  end

  def test_mobile_phone_number
    assert_match /04\d{2} \d{3} \d{3}/, Faker::PhoneNumberAU.mobile_phone_number
  end

  def test_home_work_phone_number
    assert_match /\(\d{2}\) \d{4} \d{4}/, Faker::PhoneNumberAU.home_work_phone_number
  end

  def test_phone_number
    10.times do
      assert_match /(04\d{1,2} \d{3} \d{3}|\(\d{2}\) \d{4} \d{4})/, Faker::PhoneNumberAU.phone_number
    end
  end

  def test_international_mobile_phone_number
    assert_match /\+61 \d{1,2} \d{4} \d{4}/, Faker::PhoneNumberAU.international_mobile_phone_number
  end

  def test_international_home_work_phone_number
    assert_match /\+61 \d{1,2} \d{4} \d{4}/, Faker::PhoneNumberAU.international_home_work_phone_number
  end

  def test_international_phone_number
    10.times do
      assert_match /\+61 \d{1,2} \d{4} \d{4}/, Faker::PhoneNumberAU.international_phone_number
    end
  end
end
