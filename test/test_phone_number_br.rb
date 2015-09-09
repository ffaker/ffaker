# encoding: utf-8

require 'helper'

  # Author: Gustavo Souza https://github.com/gustavor-souza
class TestPhoneNumberBR < Test::Unit::TestCase
  def setup
    @tester = FFaker::PhoneNumberBR
  end

  def test_phone_number
    assert_match /^[1-9]\d\s?[9]?\d{4}[\-]?\d{4}$/, FFaker::PhoneNumberBR.phone_number
  end

  def test_home_work_phone_number
    assert_match /^[1-9]\d\s?[2-5]\d{3}[\-]?\d{4}$/, FFaker::PhoneNumberBR.home_work_phone_number
  end

  def test_mobile_phone_number
    assert_match /^[1-9]\d\s?([6-9]|[9][6-9])\d{3}[\-]?\d{4}$/, FFaker::PhoneNumberBR.mobile_phone_number
  end

  def test_international_phone_number
    assert_match /^\+55\s?[1-9]\d\s?[9]?\d{4}[\-]?\d{4}$/, FFaker::PhoneNumberBR.international_phone_number
  end

  def test_international_mobile_phone_number
    assert_match /^\+55\s?[1-9]\d\s?([6-9]|[9][6-9])\d{3}[\-]?\d{4}$/, FFaker::PhoneNumberBR.international_mobile_phone_number
  end

  def test_international_home_work_phone_number
    assert_match /^\+55\s?[1-9]\d\s?[2-5]\d{3}[\-]?\d{4}$/, FFaker::PhoneNumberBR.international_home_work_phone_number
  end

  def test_country_code
    assert_match '+55', FFaker::PhoneNumberBR.country_code
  end
end
