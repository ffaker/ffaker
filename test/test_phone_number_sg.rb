# frozen_string_literal: true

require_relative 'helper'

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
    assert_match(/\A3\d{3}\s\d{4}\z/, @tester.voip_number)
  end

  def test_fixed_line_number
    assert_match(/\A6\d{3}\s\d{4}\z/, @tester.fixed_line_number)
  end

  def test_mobile_number
    assert_match(/\A8\d{3}\s\d{4}\z/, @tester.mobile_number)
  end

  def test_mobile_or_pager_number
    assert_match(/\A9\d{3}\s\d{4}\z/, @tester.mobile_or_pager_number)
  end

  def test_international_toll_free_number
    assert_match(/\A800\s\d{3}\s\d{4}\z/, @tester.international_toll_free_number)
  end

  def test_toll_free_number
    assert_match(/\A1800\s\d{3}\s\d{4}\z/, @tester.toll_free_number)
  end

  def test_premium_service_number
    assert_match(/\A1900\s\d{3}\s\d{4}\z/, @tester.premium_service_number)
  end

  def test_phone_number
    10.times do
      assert_match(/\A[689]\d{3}\s\d{4}\z/, @tester.phone_number)
    end
  end
end
