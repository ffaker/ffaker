# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberKR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberKR,
    :mobile_phone_number, :home_work_phone_number, :phone_number,
    :international_mobile_phone_number, :international_home_work_phone_number,
    :international_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberKR
  end

  def test_mobile_phone_number
    assert_match(/01\d \d{4} \d{4}/, @tester.mobile_phone_number)
  end

  def test_home_work_phone_number
    assert_match(/0\d{1,2} \d{3,4} \d{4}/, @tester.home_work_phone_number)
  end

  def test_phone_number
    10.times do
      assert_match(/0\d{1,2} \d{3,4} \d{4}/, @tester.phone_number)
    end
  end

  def test_international_mobile_phone_number
    assert_match(/\+82 1\d \d{4} \d{4}/,
                 @tester.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/\+82 \d{1,2} \d{3,4} \d{4}/,
                 @tester.international_home_work_phone_number)
  end

  def test_international_phone_number
    10.times do
      assert_match(/\+82 \d{1,2} \d{3,4} \d{4}/,
                   @tester.international_phone_number)
    end
  end
end
