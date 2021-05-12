# frozen_string_literal: true

require_relative 'helper'

class TestPhoneNumberBR < Test::Unit::TestCase
  include DeterministicHelper

  assert_methods_are_deterministic(
    FFaker::PhoneNumberBR,
    :phone_number, :home_work_phone_number, :mobile_phone_number,
    :international_phone_number, :international_mobile_phone_number,
    :international_home_work_phone_number, :country_code
  )

  def setup
    @tester = FFaker::PhoneNumberBR
  end

  def test_area_codes
    assert(!@tester::AREA_CODE.empty?)
    assert(@tester::AREA_CODE.sort.uniq == @tester::AREA_CODE)
    @tester::AREA_CODE.each do |area_code|
      assert_match(/\A[1-9]\d\z/, area_code)
    end
  end

  def test_phone_number
    10.times do
      assert_match(/\A[1-9]\d\s?9?\d{4}-?\d{4}\z/, @tester.phone_number)
    end
  end

  def test_home_work_phone_number
    assert_match(/\A[1-9]\d\s?[2-5]\d{3}-?\d{4}\z/,
                 @tester.home_work_phone_number)
  end

  def test_mobile_phone_number
    assert_match(/\A[1-9]\d\s?9[6-9]\d{3}-?\d{4}\z/,
                 @tester.mobile_phone_number)
  end

  def test_international_phone_number
    10.times do
      assert_match(/\A\+55\s?[1-9]\d\s?9?\d{4}-?\d{4}\z/,
                   @tester.international_phone_number)
    end
  end

  def test_international_mobile_phone_number
    assert_match(/\A\+55\s?[1-9]\d\s?9[6-9]\d{3}-?\d{4}\z/,
                 @tester.international_mobile_phone_number)
  end

  def test_international_home_work_phone_number
    assert_match(/\A\+55\s?[1-9]\d\s?[2-5]\d{3}-?\d{4}\z/,
                 @tester.international_home_work_phone_number)
  end

  def test_country_code
    assert_match('+55', @tester.country_code)
  end
end
