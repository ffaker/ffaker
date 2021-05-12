# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberTW < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberTW,
    :mobile_phone_number, :home_work_phone_number, :phone_number,
    :international_mobile_phone_number, :international_home_work_phone_number,
    :international_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberTW
  end

  def test_mobile_phone_number
    assert_match(/09\d{2}-\d{3}-\d{3}/, @tester.mobile_phone_number)
  end

  def test_home_work_phone_number
    assert_match(/\(0\d\) \d{3,4}-\d{4}/, @tester.home_work_phone_number)
  end

  def test_phone_number
    10.times do
      assert_match(/\(*0\d{1,3}\)*[\s-]\d{3,4}-\d{3,4}/, @tester.phone_number)
    end
  end

  def test_international_mobile_phone_number
    assert_match(/\+886-9\d{2}-\d{3}-\d{3}/,
                 @tester.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/\+886-\d{1}-\d{3,4}-\d{4}/,
                 @tester.international_home_work_phone_number)
  end
end
