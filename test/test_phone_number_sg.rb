# encoding: utf-8

require 'helper'

class TestPhoneNumberSG < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberSG,
    :voip_number, :fixed_line_number, :mobile_number, :mobile_or_pager_number,
    :international_toll_free_number, :toll_free_number, :premium_service_number,
    :phone_number
  )

  def setup
    @tester = FFaker::PhoneNumberSG
  end

  def test_voip_number
    assert_match(/3\d{3}\s\d{4}/, @tester.voip_number)
  end

  def test_fixed_line_number
    assert_match(/6\d{3}\s\d{4}/, @tester.fixed_line_number)
  end

  def test_mobile_number
    assert_match(/8\d{3}\s\d{4}/, @tester.mobile_number)
  end

  def test_mobile_or_pager_number
    assert_match(/9\d{3}\s\d{4}/, @tester.mobile_or_pager_number)
  end

  def test_international_toll_free_number
    assert_match(/800\s\d{3}\s\d{4}/, @tester.international_toll_free_number)
  end

  def test_toll_free_number
    assert_match(/1800\s\d{3}\s\d{4}/, @tester.toll_free_number)
  end

  def test_premium_service_number
    assert_match(/1900\s\d{3}\s\d{4}/, @tester.premium_service_number)
  end

  def test_phone_number
    10.times do
      assert_match(/[6,8,9]\d{3}\s\d{4}/, @tester.phone_number)
    end
  end
end
