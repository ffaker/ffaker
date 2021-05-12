# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberUA < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberUA,
    :phone_number, :home_phone_number, :mobile_phone_number,
    :international_home_phone_number, :international_mobile_phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberUA
  end

  def test_phone_number
    assert_match(/^(\+(380)\s|0)[0-9]{2}\s[0-9]{3}-[0-9]{4}$/, @tester.phone_number)
  end

  def test_home_phone_number
    assert_match(/^0{1}[0-9]{2}\s[0-9]{3}-[0-9]{4}$/, @tester.home_phone_number)
  end

  def test_mobile_phone_number
    assert_match(/^0{1}[0-9]{2}\s[0-9]{3}-[0-9]{4}$/, @tester.mobile_phone_number)
  end

  def test_international_home_phone_number
    assert_match(/^\+(380)\s[0-9]{2}\s[0-9]{3}-[0-9]{4}$/, @tester.international_home_phone_number)
  end

  def international_mobile_phone_number
    assert_match(/^\+(380)\s[0-9]{2}\s[0-9]{3}-[0-9]{4}$/,
                 @tester.international_mobile_phone_number)
  end
end
