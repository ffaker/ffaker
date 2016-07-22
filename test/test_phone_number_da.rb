# encoding: utf-8

require 'helper'

# Author: wiseleyb<wiseleyb@gmail.com>
class TestPhoneNumberDA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberDA,
    :home_work_phone_number, :mobile_phone_number, :phone_number, :country_code,
    :international_mobile_phone_number,
    :international_home_work_phone_number,
    :international_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberDA
  end

  def test_home_work_phone_number
    assert_match(/\A\d{8}\z/, @tester.home_work_phone_number)
  end

  def test_mobile_phone_number
    assert_match(/\A\d{8}\z/, @tester.mobile_phone_number)
  end

  def test_phone_number
    assert_match(/\A\d{8}\z/, @tester.phone_number)
  end

  def test_country_code
    assert_equal '+45', @tester.country_code
  end

  def test_international_mobile_phone_number
    assert_match(/\A\+45 \d{8}\z/, @tester.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/\A\+45 \d{8}\z/, @tester.international_home_work_phone_number)
  end

  def test_international_phone_number
    assert_match(/\A\+45 \d{8}\z/, @tester.international_phone_number)
  end
end
